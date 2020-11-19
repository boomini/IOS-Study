//
//  ViewController.swift
//  CustomIndicatorButton
//
//  Created by EMGRAM on 2020/11/19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myButton: LoadingButton!
    
    var isLoading = false
    override func viewDidLoad() {
        super.viewDidLoad()
        myButton.layer.borderColor = UIColor.black.cgColor
        myButton.layer.borderWidth = 1
        
        myButton.setTitleColor(UIColor.red, for: .normal)
    }

    @IBAction func doAction(_ sender: Any) {
        isLoading.toggle()
        //bool형 값의 상태를 변형하는 것
        
        if isLoading{
            myButton.startLoading()
        }else{
            myButton.stopLoading()
        }
    }
    
}

