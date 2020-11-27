//
//  MealModel.swift
//  Meal_Clone
//
//  Created by EMGRAM on 2020/11/27.
//

import UIKit

struct MealModel{
    var name: String
    var photo: UIImage?
    var rating: Int
   
    init(){
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
