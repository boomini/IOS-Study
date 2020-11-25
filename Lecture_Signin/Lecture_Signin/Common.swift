//
//  Common.swift
//  Lecture_Signin
//
//  Created by EMGRAM on 2020/11/25.
//

import UIKit

extension Dictionary{
    var queryString: String{
        //dictionary는 queryString으로 접근 가능.
        //값이 만들어져야된다.
        var output = ""
        for (key, value) in self{
            output = output + "\(key)=\(value)&"
        }
        output = String(output.dropLast())
        //쿼리스트링에서 마지막 부분작성을 위하여
        
        return output
    }
    
}
