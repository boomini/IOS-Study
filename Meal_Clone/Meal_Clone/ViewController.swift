//
//  ViewController.swift
//  Meal_Clone
//
//  Created by EMGRAM on 2020/11/27.
//

import UIKit

class ViewController: UIViewController {

    var mealList: [MealModel] = []
    
    @IBOutlet weak var mealTableView: UITableView!
    @IBAction func unwindToMealList(sender: UIStoryboardSegue){
        guard let detailVC = sender.source as? MealDetailViewController else{
           return
        }
        
        if let selectedIndexPath = self.mealTableView.indexPathForSelectedRow{
            //내가 누른 셀이 있냐?
            mealList[selectedIndexPath.row] = detailVC.mealModel
            self.mealTableView.reloadRows(at: [selectedIndexPath], with: .none)
            //self.mealTableView.deselectRow(at: selectedIndexPath, animated: true)
        }else{
            let insertIndexPath = IndexPath(row: mealList.count, section: 0)
            mealList.append(detailVC.mealModel)
            self.mealTableView.insertRows(at: [insertIndexPath], with: .automatic)
            //self.mealTableView.reloadData()
            //reloadRow나 insertRow는 오류가 생길 확률이 있어서 reloadData가 제일 좋은 방법
        }
        
        saveMeals()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let loadedMeals = loadMeals(){
            self.mealList = loadedMeals
        }
        if mealList.count == 0{
            let dummy1 = MealModel.init(name: "스파게티", photo: UIImage(named: "meal1"), rating: 3)
            mealList.append(dummy1)
            let dummy2 = MealModel.init(name: "케밥", photo: UIImage(named: "meal2"), rating: 5)
            mealList.append(dummy2)
            let dummy3 = MealModel.init(name: "파스타", photo: UIImage(named: "meal3"), rating: 1)
            mealList.append(dummy3)
        }
    }
    
    func saveMeals(){
        // archive
        //저장할 때 필요한것. path
        DispatchQueue.global().async{
            let documentDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first
            guard let archiveURL = documentDirectory?.appendingPathComponent("meals") else{
                //appendingPathComponent folder 경로 추가하는 느낌
                //ex) /myfolder/meals
                return
            }
        
        
//        let isSuccessSave = NSKeyedArchiver.archiveRootObject(mealList, toFile: archiveURL.path)
            do{
                let archivedData = try NSKeyedArchiver.archivedData(withRootObject: self.mealList, requiringSecureCoding: true)
                try archivedData.write(to: archiveURL)
            }catch{
                print(error)
            }
        }
        //async를 돌리면 백그라운드쓰레드에서 돌기때문에 ui쓰레드에 락을 걸지 않는다.
        
//        if isSuccessSave{
//            print("success saved")
//        }else{
//            print("failed save")
//        }
    }
    
    func loadMeals() -> [MealModel]?{
        let documentDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first
        guard let archiveURL = documentDirectory?.appendingPathComponent("meals") else{
            return nil
        }
        guard let codedData = try? Data(contentsOf: archiveURL) else{
            return nil
        }
        guard let unarchiveData = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(codedData)
        else{
            return nil
        }
        return unarchiveData as? [MealModel]
        
//        return NSKeyedUnarchiver.unarchiveObject(withFile: archiveURL.path) as? [MealModel]
    }
    
    var isEditMode = false
    @IBAction func doEdit(_ sender: Any) {
        isEditMode = !isEditMode
        mealTableView.setEditing(isEditMode, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            mealList.remove(at: indexPath.row)
            mealTableView.deleteRows(at: [indexPath], with: .automatic)
            saveMeals()
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "presentDetail"{
            print("presentDetail")
        }else if segue.identifier == "showDetail"{
            let detailVC = segue.destination as! MealDetailViewController
            
            let selectedCell = sender as! MealCell
            var selectedIndexPath = mealTableView.indexPath(for: selectedCell)
            if selectedIndexPath != nil {
                detailVC.mealModel = mealList[selectedIndexPath!.row]
            }
            selectedIndexPath = nil
        }
    }
    //무조건 세그웨이가 작동되는 경우에 무조건 호출이 된다.
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mealList.count
        //개수
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let mealCell = tableView.dequeueReusableCell(withIdentifier: "mealCell", for: indexPath) as! MealCell
        mealCell.selectionStyle = .none
        mealCell.name.text = mealList[indexPath.row].name
        mealCell.ratingView.rating = mealList[indexPath.row].rating
        mealCell.mealImageView.image = mealList[indexPath.row].photo ?? UIImage(named: "defaultPhoto")
            return mealCell
    }
    
    
}

