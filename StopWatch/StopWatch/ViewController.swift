//
//  ViewController.swift
//  StopWatch
//
//  Created by EMGRAM on 2020/11/23.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var labelMinute: UILabel!
    @IBOutlet weak var labelSecond: UILabel!
    @IBOutlet weak var labelMillisecond: UILabel!
    
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var resetButton: UIButton!
    
    var canStart = false
    var isStart = false
    
    var isStarting = false
    var timer = Timer()
    
    var startTime = 0.0
    var elapsed = 0.0
    @IBAction func startStop(_ sender: Any) {
        if isStarting{
           
            startButton.setTitle("Start", for: .normal)
            timer.invalidate()
            //stop을 하는 상태
        }else{
            //start
            startTime = Date().timeIntervalSince1970 - elapsed
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
            
            startButton.setTitle("Stop", for: .normal)
        }
        
        isStarting = !isStarting
    }
    
    
    
    @IBAction func reset(_ sender: Any) {
        elapsed = 0.0
        startTime = Date().timeIntervalSince1970 - elapsed
        resetDateLabel()
    }
    
    func resetDateLabel(){
        labelMinute.text = "00"
        labelSecond.text = "00"
        labelMillisecond.text = "00"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        startButton.setTitle("Start", for: .normal)
        resetButton.setTitle("Reset", for: .normal)
        resetDateLabel()
    }
    
    @objc func updateCounter(){
        elapsed = Date().timeIntervalSince1970 - startTime
        let date = Date(timeIntervalSince1970: elapsed)
        let df = DateFormatter()
        
        df.dateFormat = "SS"
        labelMillisecond.text = df.string(from: date)
        
        df.dateFormat = "ss"
        labelSecond.text = df.string(from: date)
        
        df.dateFormat = "mm"
        labelMinute.text = df.string(from: date)
    }


}

//timer 이해
//var startTime = 0.0
//var elapsed = 0.0
//
//Date().timeIntervalSince1970
//Date().timeIntervalSinceReferenceDate
//
//func start(){
//    startTime = Date().timeIntervalSince1970 - elapsed
//}
//func stop(){
//    elapsed = Date().timeIntervalSince1970 - startTime
//}
//timeinterval 은 누적된 초를 나타낸다.

