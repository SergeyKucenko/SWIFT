//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

import UIKit


// Character, String, Int, Double, Float, Boll

let x: Character = "q"
let y: String = "Russian Federation"
let z: Double = 1.00005 //  более точный, записывает  только 15 знаков после запятой
let w: Float = 1.0000064 // менее точный, записывет только  6 знаков после запятой
let d: Int = 123
let u: Bool = true // false

let r = false
let f = Int(123.123)
let v = Float(123.12312312312312334325)

// ниже идет пример с ИНТЕРПОЛЯЦИЕЙ СТРОКИ
let temperature = 12
let windSpees = 5
let weatheDescription = "Temperature is about 12 'C above zero and wind speed is about 5 m/s"
let weatheDescriptionI = "Temperature is about \(temperature) 'C above zero and wind speed is about \(windSpees) m/s" // ИНТЕРПОЛЯЦИЯ  код \(temperature) помогает брать значение из констанкты

let string = "\(1+2)" + "\(2+3)"

// далее пойдут массивы

let arrayOne = Array<Int>() // 1 варинат написания массива
let arrayTwo = [Int]() // 2 вариант написания масива
var arrayThree : [Int] = [] // 3 вариант написния массива - самая частая форма записи массива
let arrayFour = [1, 2, 3, 4] // 4 форма записи массива
let arrayFive = [Int](repeating: 10, count: 6)  // 5 форма записи массива, но уже не пустого

// далее пойдут основные действия с массивам и
// 1 - сложение массивов
arrayThree += arrayFive
arrayThree

arrayFour[2] // показ одного из элиментов массива
arrayThree[1...3] = [15]
arrayThree

arrayThree.count  // count  - показывает количество элиментов в массиве

arrayThree.count - 1  // указывается количство итераций,  0 1 2 3
// далее будет добавление элиментов в массив
arrayThree.append(100) // по умолчанию элимент добавляется конец массива
arrayThree.insert(105, at: 2) // если мы ходит поместить элимент не конец массива то ипользуется этот метод

// для того чтобы удалить элименты можно ипользовать несколько вариантов
arrayThree.remove(at: 4) // удаляем элимент по конкретному индексу
arrayThree

arrayThree.removeFirst() // удаление первого  элимента
arrayThree

arrayThree.removeLast() // удаление последнего   элимента
arrayThree

// далее будет следущий тип колекций, называется СЛОВАРЬ
// ниже возможные  формы записи словаря
let dictOne = Dictionary<String, String>()
let dictTwo = [String: String]()
let dictThree: [String: String] = [:]

var namesAges = ["Ivan"   : 30,  // пример словаря со значениями  и ключами
                "Vitalik": 30,
                "Sasha"  : 25]
namesAges.count
namesAges.isEmpty

namesAges["Ivan"] = 35

namesAges

let dalatesAge = namesAges.updateValue(40, forKey: "Ivan")

namesAges

namesAges["Ivan"] = nil  // уаление значения
namesAges

let deletedValue = namesAges.removeValue(forKey: "Sasha")  //если нужно использовать удаленное значение
namesAges

namesAges.removeAll() // удаляет весь словарь
namesAges
namesAges = [:] // обнуление словаря


// ДАЛЕЕ БУДУТ МНОЖЕСТВА- их называют SETS
// ниже идут варианты написания/создания МНОЖЕСТВА
let setOne = Set<String>()
let setTwo: Set<String> = []
var setThree: Set = [1, 2, 3, 4]

setThree.insert(5)
setThree.insert(6)
setThree.insert(7)

setThree.isEmpty // показывает пустой ли сет или нет
setThree.count
setThree.remove(6)
setThree

setThree.contains(1) // показввает есть ли такой элииент в сете или нет

let boolValue = setThree.contains(1) // создает новую константу, может потом ее использовать где ниудь еще
boolValue

//далее будут методы котоыре позволяют работать сетам с сетами

let setFromOneToThree: Set = [1, 2, 3, 4]
let setFromFourToNine: Set = [1, 2, 4, 5, 6, 7, 8, 9]

let allValueArray = setFromOneToThree.union(setFromFourToNine).sorted() // создаем массив из двух сетов.
let commonValueSet = setFromOneToThree.intersection(setFromFourToNine) // определяем какие значения пересекаются, коммпанда intersection  как раз для этого

let notRepeatedValueArray = setFromOneToThree.symmetricDifference(setFromFourToNine).sorted() // symmetricDifference - метод  позволяет показать различие между двух сетов

let substractedValuesArray = setFromOneToThree.subtracting(setFromFourToNine).sorted() // создаем массив который будет содержать в себе элименты 1 массива но только те которые не повторяются во втором сете

// далее будет инструкции if

let a = 3
let b = 1

if a == b{ // == это оператор сравнения
    print ("a equals to b")
}
   else if a < b  {  // else значит или / "в противномслучае" выполянем "вот это"
   print ("b exceeds a by \(b - a)") // b превосходит А на столько то
}  else if b <  a {
   print ("a exceeds b by \(a - b)")
}

// далее следуюший пример

let isSunny = true // если сегодня солнечно то я пойду погулять? т/е выполню какоето действие
var action = ""
if isSunny {
    action = "I will go for a walk"
} else {
    action = "I will sit at home"
}

action = isSunny ? "I will go for a walk" : "I will sit at home" // это называется ТЕРНАРНЫЙ оператор, по сути это тоже самое что написанно на верху с if

// далее будут примеры других операторов / примеров
// if a != b     если a не равно b
// if a <= b     если а меньше или равно b
// if a >= b     если а больше или равно b
// if a > b
// if a < b
// ~=            этот опертаор показывает принадлежит ли число к определенному диапазону, далее будет конкретный пример:

if 1...4 ~= b {
    print ("Hello World!")
}

// далее будут СОСТАВНЫЕ УСЛОВИЯ

if a == b {
    
}
let c = 5

if (c == 2 && a == 10) || c == 5 { //  если у нас С равно 2 и А равно 10 то выполянется условие  PRINT , или С равно 5 то опять же выполняется это условие т/е PRINT
    print ("Hello coder!")
}   else {
    print ("!!!") // если меняешь значение С то выводится это !!!
}

// ДАЛЕЕ БУДЕТ НОВАЯ ИНСТРУКЦИЯ GUARD (условная инструкция на на подобие if )

func someFunc (a: Int, b: Int) {
    
        guard a == b else { return } // в отличие от  IF, guard всегда имеет условие else
        guard b == 11 else { return }
    
}   // func  это функция

 // далее будет пример работы с циклами и  guard

for i in 1...5 {
    guard i != 3 else {continue} // прервать работу цыкла можно и опертаором  break. вместо continue
    print (i)
    }
// ниже идет тоже самое что и выше но с IF
for i in 1...5 {
if i == 3  {break}
print (i)
}

// ДАЛЕЕ БУДЕТ ИНСТРУКЦИЯ SWITCH
//  эта инструкция для условий сразными значениями, напримере ниже их 3,  ИСПОЛЬЗУЕТСЯ IF
let totalScore = 100
if totalScore == 10 {
    print("You're not jedi")
} else if totalScore == 20 {
    print ("you're still not jedi")
} else if totalScore == 100 {
    print("YOU'RE JEDI")
}
// далее будет написанно все тоже самое что и выше но с инструкцией SWITCH

switch totalScore {
case 10:
    print("You're not jedi")
case 20:
     print ("you're still not jedi")
case 50..<100:
     print("YOU'RE almost JEDI")
case 100:
    print("YOU'RE almost JEDI")
default: // без этого кейса switch будет проверять все значения например -1 , - 2 и тд , а так он проверят в рамках установленного диапозона и если все проходит то выдает занчение. Программа выполянется с верху в низ.
    break
}

// провека гита 
