//
//  ViewController.swift
//  Q_Delegate
//
//  Created by EMGRAM on 2020/11/19.
//

import UIKit
//delegate pattern
//다른곳에 실제로 구현할 내용을 맡겨놓고 규격만 정해서 전달한다.
// swift에서는 protocol이라는 규격으로 기본적인 형태를 만들어놓고 구현하는것은 delegate
protocol Pname{
    func test()
    var myScore: Int { get set}
    //실제로 어떤 식으로 구현할지에 대한 부분은 다른쪽에 위임을 해둔다. 위임받은 쪽에서는 구현되는 내용대로 작동을 하게된다.
    //이것이 deligate 패턴
}
class ViewController: UIViewController, LoginInfo {
    func load(id: String) {
        //logininfo안에 규격으로 연결되어 있는 func
        userID.text = id
    }
    
    @IBOutlet weak var userID: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveToLoginVC"{
            let loginVC = segue.destination as! LoginViewController
            loginVC.delegate = self
        }
    }
    //세그웨이 접근 func
}
//메인화면에 로그인화면에서 입력한 상태의 아이디를 가져와서 표시해주고 싶다. 그런경우일때 deligate 패턴으로 값을 넘겨줄 수 있다.


