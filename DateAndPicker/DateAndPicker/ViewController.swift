//
//  ViewController.swift
//  DateAndPicker
//
//  Created by EMGRAM on 2020/11/19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let currentDate = Date()
        
        var dateComponent = DateComponents()
        
        dateComponent.day = 2
        
        let maxDate = Calendar.current.date(byAdding: dateComponent, to: currentDate)
        //이틀 + 1시간이 추가된 데이트값이 들어가있다.
        datePicker.minimumDate = currentDate
        datePicker.maximumDate = maxDate
    }


    @IBAction func dateChanged(_ sender: UIDatePicker) {
        print(sender.date.timeIntervalSince1970)
    }
}

