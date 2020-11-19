//
//  ViewController.swift
//  GuardLet_Login
//
//  Created by EMGRAM on 2020/11/19.
//

import UIKit

//GuardaLet?
//특정한 조건이 맞으면 계속 진행될 수 있게, 특정한 조건이 맞지 않으면 다음 로직으로 가지 못하게 종료시키는 것.
//추가적인 작동을 하기를 원하지 않는 경우 가드렛을 사용하는게 일반적이다.
class ViewController: UIViewController {

    @IBOutlet weak var alertLabel: UILabel!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alertLabel.text = ""
        alertLabel.textColor  = UIColor.red
    }
    @IBAction func doneLogin(_ sender: Any) {
        guard let username = usernameField.text, username.count > 0 else{
            //optional type. nil값이 들어오면 객체가 생성되있지 않는 경우.
            //nil이냐를 우선 물어보고, 글자수를 체크해준다.
            alertLabel.text = "username is Empty"
            return
        }
        
        guard let password = passwordField.text, password.count > 0 else{
            alertLabel.text = "password is Empty"
            return
        }
        //guard let이나 if let이나 unwrapping하는 것은 똑같다.
        //대신 guard let으로 가져온 것은 계속 사용할 수가 있다.
        //가져오지 못할 경우 else에서 return 처리 해주는 작업이 필요하다
        if username == "kim" && password == "1234"{
        alertLabel.text = "login success"
        }else{
        alertLabel.text = "login fail"
        }
    }
    
    


}

