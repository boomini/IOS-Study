//
//  ViewController.swift
//  StructVsClass
//
//  Created by EMGRAM on 2020/11/18.
//

import UIKit
//보통 struct는 모델이나 데이터 형태를 잡을때 주로 사용한다.
//controller나 여러가지 기능등을 할 수 있는 형태는 class를 사용
struct TestStruct {
    var name: String
    var age: Int
    init(name: String, age: Int){
        self.name = name
        self.age = age
    }
}

class TestClass {
    var name: String
    var age: Int
    init(name: String, age: Int){
        self.name = name
        self.age = age
    }
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var testStruct: [TestStruct] = []
        var testClass: [TestClass] = []
        let startTime = CFAbsoluteTimeGetCurrent()
        for _ in 0..<10000000{
            testStruct.append(TestStruct.init(name: "aa", age: 0))
        }
        let durationTime = CFAbsoluteTimeGetCurrent() - startTime
        
        let startTime2 = CFAbsoluteTimeGetCurrent()
        for _ in 0..<10000000{
            testClass.append(TestClass.init(name: "aa", age: 0))
        }
        let durationTime2 = CFAbsoluteTimeGetCurrent() - startTime2
        
        print("durationTime Struct: \(durationTime)")
        print("durationTime Class: \(durationTime2)")
    }
    //struct가 더 빠르게 실행된다.
    //데이터 구조형태로 구현할 때는 struct를 사용하는 것이 더 좋다.
    //클래스는 데이터를 참조하고 struct는 데이터를 복사한다.
    //기능적인 부분이 많으면 클래스가 유리하다.
}

