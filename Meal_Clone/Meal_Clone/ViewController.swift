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
    override func viewDidLoad() {
        super.viewDidLoad()
        let dummy1 = MealModel.init(name: "스파게티", photo: UIImage(named: "meal1"), rating: 3)
        mealList.append(dummy1)
        let dummy2 = MealModel.init(name: "케밥", photo: UIImage(named: "meal2"), rating: 5)
        mealList.append(dummy2)
        let dummy3 = MealModel.init(name: "파스타", photo: UIImage(named: "meal3"), rating: 1)
        mealList.append(dummy3)
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "presentDetail"{
            
        }else if segue.identifier == "showDetail"{
            let detailVC = segue.destination as! MealDetailViewController
            
            let selectedCell = sender as! MealCell
            if let selectedIndexPath = mealTableView.indexPath(for: selectedCell){
                detailVC.mealModel = mealList[selectedIndexPath.row]
            }
            
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
        
        mealCell.name.text = mealList[indexPath.row].name
        mealCell.ratingView.rating = mealList[indexPath.row].rating
        mealCell.mealImageView.image = mealList[indexPath.row].photo
            return mealCell
    }
    
    
}

