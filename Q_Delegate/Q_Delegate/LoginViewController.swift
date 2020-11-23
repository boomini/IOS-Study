//
//  LoginViewController.swift
//  Q_Delegate
//
//  Created by EMGRAM on 2020/11/23.
//

import UIKit

protocol LoginInfo {
    func load(id: String)
}
//규격만 만들어 놓은거지 작동하는 것은 아니다.
class LoginViewController: UIViewController {
    var delegate: LoginInfo?
    //optional로 해놓아야 한다.
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func TextChanged(_ sender: UITextField) {
        delegate?.load(id: sender.text ?? "")
    }
    

}
