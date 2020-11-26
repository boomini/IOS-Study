//
//  SignUpViewController.swift
//  Lecture_Signin
//
//  Created by EMGRAM on 2020/11/24.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var buttonSignUp: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonSignUp.layer.cornerRadius = buttonSignUp.bounds.size.height / 2
        // Do any additional setup after loading the view.
    }
    @IBAction func SignUpApiCall(_ sender: Any) {
        let param = ["name" : nameField.text ?? "",
                     "password" : passwordField.text ?? "",
                    "email" : emailField.text ?? ""]
        
        if let url = URL(string: "http://localhost:3000/loginUsers"){
            var request = URLRequest.init(url: url )
            //get방식 이외의 method는 URLRequest에 별도로 지정을 해주어야 한다.
            
            request.httpMethod = "POST"
            request.httpBody = param.queryString.data(using: .utf8)
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                guard let data = data else{
                    //alert
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let user = try decoder.decode(LoginUser.self, from: data)
                    
                    User.shared.info = user
                    DispatchQueue.main.async {
                        self.dismiss(animated: true, completion: nil)
                        NotificationCenter.default.post(name: NSNotification.Name.init("UserInfoLoad"), object: nil)
                    }
                    
                }catch{
                    print("Sign up Error \(error)")
                }
                
                
            }.resume()
        }
        
    }
    //HTTP Method => POST
    //query => Body
    
    // GET -> URL + query
    
    
    @IBAction func popVC(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}
