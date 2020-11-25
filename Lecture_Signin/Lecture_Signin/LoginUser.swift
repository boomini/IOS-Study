//
//  LoginUser.swift
//  Lecture_Signin
//
//  Created by EMGRAM on 2020/11/25.
//

import UIKit
//singleton 인스턴스가 한번 생성되면 계속 유지되서 같은 값을 나오게 하는 형태
//특정용도로 객체를 하나 생성하여 공용으로 사용하고 싶을 때 사용하는 방법이다. 주로 환경설정, 로그인 정보등을
//특정용도로 생성해둔 객체에 넣어두고 여러 객체에서 접근 가능하도록 하여 데이터를 사용하는 것이다.
//이 객체는 임의로 메모리에서 해체해주지 않는 이상 프로그램이 실행되고 끝날때까지 메모리에 유지된다.
class User{
    static let shared = User()
    var info = LoginUser()

    private init(){
        //인스턴스화가 되는 것을 막기위해 외부에서 initialize를 할 수 없게 설정해준다.
    }
}

//class Test{
//    func test(){
//        //var user1 = User()
//        //var user2 = User()
//        //이런식이면 만들때마다 인스턴스화 시키는것이다.
//        var user1 = User.shared.info
//        var user2 = User.shared.info
//    }
//}
//modeling
struct LoginUser: Codable {
    init() {
        name = ""
        password = ""
        email = ""
        id = 0
        locations = [LocationModel]()
    }
    struct LocationModel: Codable {
        let city: String?
        let state: String?
    }
    let name: String?
    let password: String?
    let email: String?
    let id: Int?
    let locations: [LocationModel]?
}
//struct로 만드는것에 문제가 없다면 struct로 만드는것이 좋다.
//class는 struct에 비해 자원을 많이 사용한다.
//참조에 대한 개념이 특별하게 필요하지 않으면 struct가 좋다.

//외부에서 접근할 필요없이 또다른 struct안에서만 접근할 model이라면 해당 struct안에 모델을 만들 수 있다.
//그렇게 하는 방법이 혼란을 방지할 수 있따.
