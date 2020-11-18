//
//  DetailViewController.swift
//  LifeCycleVC
//
//  Created by EMGRAM on 2020/11/18.
//

import UIKit

class DetailViewController: UIViewController {

    override func awakeFromNib() {
        super.awakeFromNib()
        print("awakeFromNib") //optional, once
    }
    //가장 먼저 호출이 된다고 보면된다.
    //화면이 연결이 되어서 instance화 시킨 시점
    //호출이 될수도 안될수도 있는데 화면 없이 viewcontroller를 직접 구현한 경우 호출이 안된다.
    //let testVC = UIViewController() //다음과 같이 코드로 호출할 경우 awakeFromNib이 호출이 안된다.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad") // once

        // Do any additional setup after loading the view.
    }
    //화면이 나올 준비를 한 상태
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    //화면이 다 준비가 되어서 나오기 직전의 상태
    //화면이 가려지고 다시나타날때도 호출된다.
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWilldisapper")
    }
    //화면이 사라지는 시점

    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewDidDisappear")
    }
    
    deinit{
        print("deinit")
    }
    //최종적으로 controller가 완전히 해지되었을 때, 메모리가 사라졌을 때 호출된다.
}
