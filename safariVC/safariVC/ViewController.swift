//
//  ViewController.swift
//  safariVC
//
//  Created by EMGRAM on 2020/11/19.
//

import UIKit
import SafariServices
class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onClick(_ sender: Any) {
        let vc = SFSafariViewController(url: URL(string: "https://www.apple.com")!)
        self.show(vc,sender: self)
    }
}

