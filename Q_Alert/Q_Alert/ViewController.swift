//
//  ViewController.swift
//  Q_Alert
//
//  Created by EMGRAM on 2020/11/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func displayAlert(_ sender: Any) {
        
        let alert = UIAlertController(title: nil, message: "선택하세요", preferredStyle: .actionSheet)
        
        let delete = UIAlertAction(title: "삭제", style: .default, handler: nil)
        let save = UIAlertAction(title: "저장", style: .default, handler: { (action) in
            //저장버튼을 눌렀을 때 실행할 코드
        })
        let cancel = UIAlertAction(title: "취소", style: .destructive, handler: nil)
        
        alert.addAction(delete)
        alert.addAction(save)
        alert.addAction(cancel)
        
        self.present(alert, animated: true, completion: nil)
        //화면에 띄우는.
    }
    
}

