//: Playground - noun: a place where people can play
//RE &679*
//

import UIKit

var str = "Hello, playground"

//Let and Var
print("Swift"+"_"+"language")
let myStrID = "BGI_679"
print("\(myStrID)") //or print(myStrID)

var myVariable = 21
myVariable = 32
let myConstant = 3 //myConstant = 4 Can not change a constant value

var impInt = 42
let impDou = 42.0
let expFlo4:Float = 4
let expDou4:Double = 4 //Dif: Float 4bits,.0(8),+-3.40E+38; Double 8bits,.0(16),+-1.79E+308

//Translate Int and String
let tranIntToStr = myStrID + "_" + String(Int(expDou4))

//Array
var myArray = [String]()
myArray = ["apple","pear","banana"]
myArray[1] = "orange"
for i in 0..<2 {
print("\(myArray[i])")
}

//Dictionary
var myDic = Dictionary<String,Int>()
myDic = ["Shenzhen":20,"Beijing":10]
myDic["Wuhan"] = 50
print(myDic)

//Control Flow
for (keys,value) in myDic {
    if value > 15 {
        impInt += 5
    } else {
        impInt += 7
    }
}
impInt

//Switch
var vegetable = "celery pepper" //TEST
var vegetableComment:String
switch vegetable {
    case "celery": vegetableComment = "Add some raisins and make ants on a log."
    case "cucumber", "watercress": vegetableComment = "That would make a good tea sandwich."
    case let x where x.hasSuffix("pepper"): vegetableComment = "Is it a spicy \(x)"
    case let y where y.hasPrefix("celery"): vegetableComment = "Has celery"
    default : vegetableComment = "Everything tastes good in soup."
}
print("\(vegetableComment)")

//For ... in
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 19, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
var kinds:String! = nil
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            kinds = kind
        }
    }
}
print( "\(kinds)"+"_\(largest)")


//Functions and Closures
func greet(name: String, day: String, food: String) -> String {
    return "Hello \(name), today is \(day), food is \(food)."
}
greet("Bob",day: "Tuesday",food: "apple")

func sumOf(numbers: Double...) -> (Double,Double){
    var sum = 0.0
    var ave = 0.0
    for number in numbers{
        sum += number
        ave++
    }
    ave = sum/ave
    return (sum,ave)
}
sumOf(2,3,5,7,11) //TEST

//a Function take another Function
func hasAnyMatches(list: [Double], condition: Double -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Double) -> Bool {
    return number < 10.0
}
var numbers = [20.0, 19, 27, 12, 2] //[20] error
hasAnyMatches(numbers, condition: lessThanTen)

//Closures &679*
var numbers1 = [1,2,3,4,5]
var numTmp1 = numbers1.map({(number: Int) -> Int in
//    let result = 3 * number
    if number%2 != 0 {
        return 0} else {
        return number*3
    }
})
print(numTmp1)

var maxNum = ([1, 5, 3, 12, 2]).sort{$0 > $1}
print(maxNum)

var names = ["Swift", "Arial", "Soga", "Donary"]
var reversed = names.sort(>)

var array = [2,3,7,5,11]
array = array.sort{$0>$1}
var newArray = array.map{$0 * 3 + 2}
var filterArray = array.filter{$0 % 2 == 0}
print(array,filterArray,newArray)

//Objects and Classes
//class Shape {
//    var numberOfSides = 0
//    let arthorOfSides = "bgi"
//    func simpleDescription() -> String{
//        return "A shape with \(numberOfSildes), write by \(arthorOfSlides)."
//    }
//}
//var shape = Shape()
//shape.numberOfSildes = 7
//var shapeDescription = shape.simpleDescription()

class NameShape {
    var numberOfSides:Int = 0
    var name : String
    
    init(name:String){
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}
class Square: NameShape {
    var sideLength: Double
    
    init(sideLength:Double, name:String){
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double{
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)"
    }
}
let squareTest = Square(sideLength: 3.14, name: "my test square")
squareTest.area()
squareTest.simpleDescription()

class Circle: NameShape {
    let pi = 3.1415926
    var rLength:Double
    
    init(rlength:Double, name:String){
        self.rLength = rlength
        super.init(name: name)
    }
    
    func area() -> Double{
        return pi * rLength * rLength
    }
    
    override func simpleDescription() -> String {
        return "A circle with r of \(rLength)"
    }
}
var circleTest = Circle(rlength: 3, name: "my test circle")
circleTest.area()
circleTest.simpleDescription()

//Getter and Setter in init
class EquilateralTraiangle: NameShape{
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String){
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
}
    var perimeter: Double{
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triagle with sides of length \(sideLength)."
    }
}
var triangle = EquilateralTraiangle(sideLength: 3.1, name: "a triangle")
triangle.perimeter
triangle.simpleDescription()
triangle.perimeter = 99.9
triangle.sideLength
triangle.simpleDescription()

class TriangleAndSquare {
    var sizeLength=0.0
    var triangle: EquilateralTraiangle {
        willSet {
            square.sideLength = newValue.sideLength
            sizeLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
            sizeLength = newValue.sideLength
        }
    }
    init (size: Double, name: String){
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTraiangle(sideLength: size, name: name)
        sizeLength = size
    }
    func simpleDescription() -> String {
        return "a triangle and a square with same size of \(sizeLength)"
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "a triangle and a square with same size")
triangleAndSquare.simpleDescription()
triangleAndSquare.square.sideLength
triangleAndSquare.triangle.sideLength
triangleAndSquare.square = Square(sideLength: 25, name: "Larger square")
triangleAndSquare.triangle.sideLength
triangleAndSquare.simpleDescription()

let optionalSquare:Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength

class Counter {
    var count: Int = 0
    // name insider and outsider
    func incremtBy (amount: Int, numberOfTimes times:Int) -> Int {
        count += amount * times
    return count
    }
}
var counter = Counter()
counter.incremtBy(1, numberOfTimes: 2)
counter.incremtBy(3, numberOfTimes: 4)

//designated and convenience
class ClassA {
    let numA: Int
    required init(num: Int) {
        numA = num
    }
    convenience init(bigNum: Bool) {
        self.init(num: bigNum ? 10000 : 1)
    }
}
class ClassB: ClassA {
    let numB: Int
    required init(num: Int) { //required
        numB = num + 1
        super.init(num: num)
    }
}
let anObj = ClassB(bigNum: false)
print(anObj.numA,anObj.numB)

//Enum
enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}

func compareRanks(firstRank: Rank, secondRank:Rank) -> Bool {
        if (firstRank.rawValue > secondRank.rawValue) {
            return true
        } else {
            return false
        }
    }
let ace = Rank.Two
ace.simpleDescription()
let aceRawValue = ace.rawValue
let king = Rank.King
let compareTmp = compareRanks(ace, secondRank: king)

//toRaw and fromRaw
if let convertedRand = Rank(rawValue: 13){
    let threeDescription = convertedRand.simpleDescription()
}

enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
    
    func color() -> String{
        switch self {
        case .Spades, .Clubs:
            return "black"
        case .Hearts, .Diamonds:
            return "red"
//        case .Diamonds:
//            return "diamonds"
//        case .Clubs:
//            return "clubs"
        }
    }
    
}
let hearts = Suit.Hearts
let heartsDescription = hearts.simpleDescription()
let heartsColor = hearts.color()

//Structure
struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .Three, suit: .Spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

//Protocol
protocol ExampleProtocol {
    var simpleDescription: String {get}
    mutating func adjust()
}

class Simpleclass: ExampleProtocol {
    var simpleDescription: String = "A simple class"
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += " Now 100% adjusted"
    }
}
var classTmp = Simpleclass()
classTmp.simpleDescription
classTmp.adjust()
classTmp.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var structTmp = SimpleStructure()
structTmp.adjust()
structTmp.simpleDescription

enum SimpleEnum: ExampleProtocol {
    case raw
    case adjust1
    var simpleDescription: String {
        get {
            switch self {
            case .raw:
                return "A simple enum"
            case .adjust1:
                return "A simple enum adjusted"
            }
        }
    }
    mutating func adjust()  {
        switch self {
        case .raw:
            self = .adjust1
        case .adjust1: break
        }
    }
}
var enumTmp = SimpleEnum.raw
enumTmp.simpleDescription
enumTmp.adjust()
enumTmp.simpleDescription

//Extension
extension Int: ExampleProtocol{
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}












