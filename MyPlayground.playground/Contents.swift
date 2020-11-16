import UIKit

//operator
let a = 101
let b = 29
a == b
a != b

let aa = false

!aa


if a == b {
    print("same")
}else {
    print("different")
}

a == b ? print("same") : print("different")

//??
var bb: Int?

print(bb ?? 0)

for index in 0...5{
    print("iter")
}

for index in 0..<5{
    print("iter\(index)")
}

let myArray = ["a","b","c","d"]
for index in 0..<myArray.count {
    print("\(myArray[index])")
}

for myValue in myArray[0...]{
    print("arrayvalue:\(myValue)")
}

//Optional Type
//Expression : ?
//important
var myScore: Int?

if myScore == nil{
    print("E")
}

myScore = 0
if myScore! < 60 {
    print("F")
}

var myTestScore: Int?
var score: Int?

score = 50
score = myTestScore

if score == nil{
    print("nil")
}else if score! < 100{
    print("has score")
}

if let opScore = score {
    if opScore<50{
        print("smaller than 50")
    }
}else {
    print("nil")
}

class People{
    var score: Score?
}
class Score{
    var testName: String?
}

var people : People? = People()

people!.score?.testName
if let hasName = people?.score?.testName{
    if hasName == "park"{
        
    }else  {
        print("nillll")
    }
}

var myscore: Int?
print(myscore ?? 0)

if myscore ?? 0 < 50 {
    print("score")
}
///////////////////////////////////////////////////////////////////////////////////


