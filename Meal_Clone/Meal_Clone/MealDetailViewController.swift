//
//  MealDetailViewController.swift
//  Meal_Clone
//
//  Created by EMGRAM on 2020/11/27.
//

import UIKit

class MealDetailViewController: UIViewController {

    @IBAction func closeView(_ sender: Any) {
        //self.present
        //dismiss
        
        
        //self.navigationController.push
        //pop
        let presentingVC = presentingViewController is UINavigationController
        
        if presentingVC == true{
            self.dismiss(animated: true, completion: nil)
        }else{
            self.navigationController?.popViewController(animated: true)
        }
    }
    @IBOutlet weak var ratingView: RatingView!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var mealImageView: UIImageView!
    
    var mealModel = MealModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        nameField.text = mealModel.name
        ratingView.rating = mealModel.rating
        mealImageView.image = mealModel.photo ??  UIImage(named: "defaultPhoto")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
