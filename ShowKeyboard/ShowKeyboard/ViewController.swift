//
//  ViewController.swift
//  ShowKeyboard
//
//  Created by EMGRAM on 2020/11/19.
//

import UIKit
class DetailViewController: UIViewController{
    
    
    @IBOutlet weak var myTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        super.viewWillAppear(animated)
        myTF.becomeFirstResponder()
    }
    @IBAction func hideKeyboard(_ sender: Any) {
        myTF.resignFirstResponder()
        
        //myTF.endEditing(true)
        //똑같이 키보드가 내려간다.
    }
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

