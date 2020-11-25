//
//  SignInViewController.swift
//  Lecture_Signin
//
//  Created by EMGRAM on 2020/11/24.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    let loginURLString = "http://localhost:3000/loginUsers"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonSignIn.layer.cornerRadius = buttonSignIn.bounds.size.height / 2
        buttonSignIn.layer.borderWidth = 1
        buttonSignIn.layer.borderColor = UIColor.white.cgColor
        
        self.navigationController?.setNavigationBarHidden( true, animated: false)
    }
    @IBOutlet weak var buttonSignIn: UIButton!

    @IBAction func moteToSignUp(_ sender: Any) {
        let signUpVC = UIStoryboard(name:"SignUpVC", bundle: nil).instantiateViewController(withIdentifier: "signUpVC")
        //navigationController형태로 감싸준다.
        //push 사용.
        //다시말하면 signin이라는 화면이 navigation구조여야 한다.
        
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }
    @IBAction func signInAPICall(_ sender: Any) {
        //parameter key:value
        //get post
        //URLSession으로 네트워크 통신.
        var param = ["userName" : userNameTextField.text ?? "",
                     "password" : passwordTextField.text ?? ""]
        //parameter는 이런 dictionary로 보낼 수 없고 query string모양으로 바꿔주어아한다.
        param.queryString
        //query string key=value&key=value
        
        //
        
        //network
//        let loginURL = URL(string: "http://localhost:3000/loginUsers" + "?" + param.queryString)
        //string형식으로 이어붙이다보면 실수를 유발할 가능성이 있다.
        
        //URLComponents
        var urlComponents = URLComponents(string: loginURLString)
        
        urlComponents?.query = param.queryString
        guard let hasURL = urlComponents?.url else{
            return
        }
        
        //model
        //codable
        
        URLSession.shared.dataTask(with: hasURL) { (data, response, error) in
            guard let data = data else{
                return
            }
            
            let decoder = JSONDecoder()
            //json형태로 decoding해주는 객체
            
            do{
                let user = try decoder.decode([LoginUser].self, from: data)
                //jsondecoder 객체를 사용하기 위해서는 try처리를 해주어야 하며, try는 optional형태로 쓴다.
                //하지만 do catch문으로 쓰면 catch문에서 예외처리를 해주기 때문에 optional형태로 써주지 않아도 된다.
                print("user ==> \(user)")
                //user[0].locations.state
                
                if let hasUserInfo = user.first{
                    User.shared.info = hasUserInfo
                    //이걸 입력한 순간 어디에서든지 info내용을 조회해보면 network에서 받은 값이 유지되게 된다.
                    //싱글톤을 너무 많이 만들게 되면 복잡도를 높일 수 있는 상황이 만들어 질 수도 있다.
                    DispatchQueue.main.async {
                        self.dismiss(animated: true, completion: nil)
                        NotificationCenter.default.post(name: NSNotification.Name.init("UserInfoLoad"), object: nil)
                    }
                    
                }else{
                    //alert
                    DispatchQueue.main.async {
                        //이것이 메인쓰레드
                        
                        let alert = UIAlertController(title: "유저정보가 없음", message: nil, preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: { (element) in
                            //작동해야하는 코드를 입력
                        }))
                        alert.addAction(UIAlertAction(title: "취소", style: .default, handler: { (element) in
                            //작동해야하는 코드를 입력
                        }))
                        self.present(alert, animated: true, completion: nil)
                        
                        //datatask closure안에서 코드를 작성하는 중이다. 이말은 메인쓰레드가 아닌 또다른 쓰레드를 의미한다.
                        //alert처럼 ui적으로 작동할 필요가 있는 코드는 메인쓰레드에 작성해주어야 한다.
                    }
                   
                    
                }
                
            }catch{
                //에러 처리
                print("error ==> \(error)")
            }
            
            
        }.resume()
        //resume을 해야 실제 실행이 된다.
        //가로안에 내용은 설정값
        
        
        
        
        
        
        
        
        
        
        
        //parameter라는 개념이 한번만 사용할 것이 아니라 extension dictionary는 만들어 놓으면 여기저기서 계속 사용하기 때문에 클래스를 따로 만들어 놓는게 좋다.
    }
    @IBAction func before(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}


