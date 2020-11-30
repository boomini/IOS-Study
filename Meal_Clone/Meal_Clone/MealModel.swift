//
//  MealModel.swift
//  Meal_Clone
//
//  Created by EMGRAM on 2020/11/27.
//

import UIKit

class MealModel: NSObject, NSCoding, NSSecureCoding{
    static var supportsSecureCoding: Bool{
        return true
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        //이 값이 저장되는 key가 필요. dictionary형태라고 생각해주면 된다.
        aCoder.encode(photo, forKey: "photo")
        aCoder.encode(rating, forKey: "rating")
    }
    //encoding해서 저장
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: "name") as! String
        let photo = aDecoder.decodeObject(forKey: "photo") as? UIImage
        let rating = aDecoder.decodeInteger(forKey: "rating")
        
        self.init(name: name, photo: photo, rating: rating)
    }
    //내가 init을 사용할 수 있게 호출해서 사용한다하면 convenience init을 사용한다.
    //가져올 때는 decoding해서 가져온다.
    
    //아카이브할때 주의할 점 : NSCoding프로토콜을 반드시 준수해야하며
    // 이프로토콜을 사용하기 위해서는 struct가 아닌 class 형태로 된것만 nscoding이 가능
    var name: String
    var photo: UIImage?
    var rating: Int
   
    override init(){
        self.name = ""
        self.rating = 0
    }
    init(name: String, photo: UIImage?, rating: Int) {
        self.name = name
        self.photo = photo
        self.rating = rating
    }
    //optional로 구현한것이 아니라면 반드시 initialize를 해주어야 한다.

}
