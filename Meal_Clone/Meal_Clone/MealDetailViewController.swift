//
//  MealDetailViewController.swift
//  Meal_Clone
//
//  Created by EMGRAM on 2020/11/27.
//

import UIKit


class MealDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    

    @IBOutlet weak var ratingView: RatingView!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
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

    
    var mealModel = MealModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ratingView.delegate = self
        nameField.text = mealModel.name
        ratingView.rating = mealModel.rating
        mealImageView.image = mealModel.photo ??  UIImage(named: "defaultPhoto")
        ratingView.isEditMode = true
        saveButton.isEnabled = false
        
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(imageTap))
        mealImageView.addGestureRecognizer(tapGesture)
        mealImageView.isUserInteractionEnabled = true
    }
    
    @objc func imageTap(){
        print("image tap")
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        //delegate를 이용해서 선택된 이미지를 가져올 수 있다.
        
        self.present(imagePickerController, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        guard let selectedImage = info[.originalImage] as? UIImage else{
            //우리 핸드폰에 있는것이 이미지 뿐아니라 영상도 있기 때문에 강제로 캐스팅하는 것은 위험하다.
            return
        }
        
        mealModel.photo = selectedImage
        mealImageView.image = selectedImage
        saveButtonStatus()
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func didChanged(_ sender: UITextField) {
           
        saveButtonStatus()
    }
    
    func saveButtonStatus(){
        if nameField.text?.isEmpty ?? true{
            saveButton.isEnabled = false
        }else{
            saveButton.isEnabled = true
        }
    }
    @IBAction func saveMeal(_ sender: Any) {
        print("save meal")
        
        mealModel.rating = ratingView.rating
        mealModel.name = nameField.text ?? ""
        mealImageView.image = mealImageView.image
        self.performSegue(withIdentifier: "toMealList", sender: self)
        //performSegue: 스토리보드상에서 performSegue를 정의한 viewcontroller적으로 화면이자동으로 이동한다.
        //storyboard상에서 viewController를 exit로 unwindsegue연결을 해놓아야 작동한다.
    }
    
}

extension MealDetailViewController : RatingViewDelegate{
    func ratingStatusChanged() {
        saveButtonStatus()
    }
}
