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
        
    }
}else {
    print("nillllll")
}

var myscore: Int?
print(myscore ?? 0)

if myscore ?? 0 < 50 {
    print("score")
}
///////////////////////////////////////////////////////////////////////////////////


//Collection Types
//Array
var someStrings = [String]()

someStrings.append("aa")
someStrings.append("bb")
someStrings.append("CC")

someStrings.remove(at: 1)
print(someStrings)

var removeIndex = 1
if someStrings.count - 1 >= removeIndex{
    someStrings.remove(at: removeIndex)
}

print(someStrings)

//set
var strings = Set<String>()
strings.insert("aa")
strings.insert("bb")
strings.insert("cc")

strings.remove("dd")


strings.insert("aa")
print(strings)

var strings1 = Set<String>()
strings1.insert("aa")
strings1.insert("bb")
strings1.insert("cc")
strings1.insert("zz")

var strings2 = Set<String>()
strings2.insert("11")
strings2.insert("22")
strings2.insert("33")
strings2.insert("zz")
let union = strings1.union(strings2)
print(union)

let inter = strings1.intersection(strings2)
print(inter)

let symm = strings1.symmetricDifference(strings2)
print(symm)

let sub = strings1.subtracting(strings2)
print(sub)


//dictionary
var sports = [String : Any]()
sports["soccer"] = "korea"
sports["baseball"] = 3
sports["football"] = true

print(sports)

sports.count

print(sports["soccer"]!)

if let hasSoccer = sports["soccer"]{
    print(hasSoccer)
}else{
    print("nil")
}



//For-in
//Array
var names = ["lee","kim","john","brain"]
var ages = [5,6,2,7,5]

for _ in names{
}

for element in names{
    print(element + " sir")
}
for element in ages {
    print(element + 10)
}

//Dictionary
var peoples = ["john" : 5, "lee" : 10, "kim" : 7]
for element in peoples{
    print(element.key)
    print(element.value)
}
for index in 0..<peoples.count{
    print(index)
}

for index in (0..<peoples.count).reversed(){
        print(index)
}
var someNumber = 7
switch someNumber {
case 5:
    print("555")
default:
    print("default")
}

switch someNumber{
case 5...10 :
    print("5-10")
case 11...15:
    print("!!-15")
default:
    print("default")
}
func sume2(_ num1: Int, _ num2: Int) -> Int {
    return num1 + num2
}

print(sume2(50,23))

func sayHi() -> String{
    return "hello"
}
var sayGreet = { () -> String in
    return "Hello2"
}

sayHi()
sayGreet()


var name = ["apple", "lemon", "brown", "red", "band", "candy", "we"]

func filterStirng(datas: [String], firstString: String) -> [String] {
    var newDatas = [String]()
    for index in 0..<datas.count{
        if datas[index].first?.description == firstString{
            newDatas.append(datas[index])
        }
    }
    return newDatas
}

filterStirng(datas: name, firstString: "a")

func filterStringClosure(datas: [String], closure: (String) -> Bool) -> [String]{
    var newDatas = [String]()
    for data in datas{
        if closure(data) == true {
            newDatas.append(data)
        }
    }
    return newDatas
}

let filtered = filterStringClosure(datas: name) { (element) -> Bool in
    if element.first?.description == "a" {
        return true
    }
    return false
}

print(filtered)

var findA: (String) -> Bool = { element in
    if element.first?.description == "a" {
        return true
    }
    return false
}

var findB: (String) -> Bool = {element in
    if element.first?.description == "b"{
        return true
    }
    return false
}

var stringLength5: (String) -> Bool = {element in
    if element.count == 5{
        return true
    }
    return false
}

filterStringClosure(datas: name, closure: findA)
filterStringClosure(datas: name, closure: findB)
filterStringClosure(datas: name, closure: stringLength5)


func greetingClosure(name: String) -> () -> String{
    return { return "h1 " + name }
}

greetingClosure(name: "minho")()

enum currentPoint{
    case current
    case near
    case other
}

enum ImageType{
    case none
    case jpg
    case png
    case gif
}

var imageType = ImageType.gif
var image: ImageType = .none
image = .jpg
if imageType == .gif {
    
}else{
    
}


enum MediaType{
    case picture(width: String, height: String)
    case movie(length: Int)
}

var media = MediaType.picture(width: "200", height: "300")
media = .movie(length: 50)

switch media {
case .movie(length: let length):
    print(length)
case .picture(width: let width, height: let height) :
    print(width)
    print(height)
}
class SomeClass{
    var firstScore = 10
    var secondScore = 20
    
    var totalScore: Int{
        get{
            //totalscore가 결론적으로 가지게 되는 값.
            return firstScore + secondScore
        }
        //set을 정의하지 않으면 읽기 전용이 된다.
    }
//    var totalScore1 = 0
//    func totalScore() -> Int {
//        totalScore1 = firstScore + secondScore
//        return totalScore1
//    }

}

var someClass = SomeClass()
//set이 있어야만 값을 받아 올 수 있다.


extension UIColor{

}
var titleColor: UIColor!
var descriptionColor: UIColor!

extension UIColor {
    var mainRedColor: UIColor {
        return UIColor(red: 240/256, green: 30/255, blue: 30/255, alpha: 1)
    }
    var subGreenColor: UIColor {
        return UIColor(red: 50/255, green: 250/255, blue: 30/255, alpha: 1)
    }
}
titleColor = UIColor().mainRedColor
descriptionColor = UIColor().subGreenColor

class MyClass: UIViewController, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
