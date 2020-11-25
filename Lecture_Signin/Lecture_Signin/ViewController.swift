//
//  ViewController.swift
//  Lecture_Signin
//
//  Created by EMGRAM on 2020/11/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userInfoLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(infoReLoad), name: NSNotification.Name.init("UserInfoLoad"), object: nil)
    }
    
    @objc func infoReLoad() {
        //selector를 사용하기 위해선 @objc를 해주어야 한다.
        DispatchQueue.main.async {
            self.userInfoLabel.text = User.shared.info.email
        }
        
    }


    @IBAction func moveToSignIn(_ sender: Any) {
        let signInVC = UIStoryboard(name: "SigninVC", bundle: nil).instantiateViewController(withIdentifier: "naviSignin")
        //대소문자 구별 필요
        self.present(signInVC, animated: true, completion:{
            //객체 가지고 와서 뿌려준다.
            //viewcontroller, animated : 나오는 효과를 줄 것인지 안줄 것인지
            //completion : 생략되는 closure형태 할게없으면 nil optional이기 때문에 nil형태 가능
        })
        }
    
}

