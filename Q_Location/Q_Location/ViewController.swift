//
//  ViewController.swift
//  Q_Location
//
//  Created by EMGRAM on 2020/11/19.
//

import UIKit
import CoreLocation
class ViewController: UIViewController, CLLocationManagerDelegate {
    //CLLocationManagerDelegate는 다 optional이여서 강제로 선언해줘야 하는 부분은 없다.
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //best, killometer등등이 있는데(정확도 수준에 따라) best가 기본이라고 생각하고 설정해주면 된다.
        locationManager.requestWhenInUseAuthorization() //사용자 허용 alert
        //물어보는 문구는 info.plist에 써야한다.
        
        if CLLocationManager.locationServicesEnabled(){
            //허용이되어야한다.
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let userLocation = locations.first{
            print("lat \(userLocation.coordinate.latitude)")
            print("lon \(userLocation.coordinate.longitude)")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("location error \(error)")
    }


}

