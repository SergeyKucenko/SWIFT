import UIKit

var str = "Hello, playground"

// ДАЛЕЕ БУДЕТ ЦИКЛ FOR IN (это самый часто используемый цикл)

//-----------------
for i in 1...5 {
    print(i)
}
//-----------------
//let array = [1, 2, 3, 4]  // добавяем к простому цыклу  массивы
let arrayOfStrings = ["a", "b", "c"]
for index in arrayOfStrings {
    print(index)
}
// далее пойдет следующий пример

// далее будет показано как рабоатет цикл с более сложными элиментами

let nameAndFingers = ["Ivan": 20, "Svetlana":18, "Nadejda": 15]

for (name, numberOfFingers) in nameAndFingers {
    print("Pyro name is \(name) and number or fingers \(numberOfFingers)") // таким образом мы можем перебирать словари
}

// далее будет пример с перебором массива (нужно найти индекс элимента который делится на 2)
for (index, value) in arrayOfStrings.enumerated() {
    print(index, value)
}

// для того чтобы массив преебирал через 2 элимента
for i in stride(from: 0, through: 15, by: 5) {
    print(i)

}

// ДАЛЕЕ БУДУТ ЦЫКЛЫ  while, repeat-write

// while - значение ПОКА , пока выполняется условие - выполянется тело цыкла/  и цыкл выполянется пока уловие верно

var timer = 5
print("Couting down")

while timer > 0 {
    print(timer)
    timer -= 1 // до какого условия выполянется цикл
}
print("Start")

// далее будет пример этого цикла с  repeat-while

//var timer = 5
//print("Couting down")
//
//repeat {  // цикл выполянется без проверки условия
//    print(timer)
//    timer -= 1 // до какого условия выполянется цикл
//} while timer > 0
//print("Start")


// ДАЛЕЕ БУДУТ ФУНКЦИИ !!!! (это обособленные куски кода у которых есть свое имя )

// 1. простая функция, ничего не принимающая и ничего не возвращающая

func sayHello () {
    print("Hello")
}

sayHello()  // таким образом вызывается функция

// 2. функция, принимающая один параметр

func oneParam(param: Int) {
    var param = param
    param += 1
}
 oneParam(param: 11)

// 3. функция,  не принимающая параметров(аргументов), но возвращающая значние

func returnValue() -> Int {
    return 10
}
returnValue()

let a = returnValue() // пример присваемого значения, в данном слуаче для А
a
//_______________________________________________________________________________________________
// 4. функция, принимающая несколько параметров и возвращающая значение (САМЫЙ ЧАСТО ИСПОЛЬЗУЕМЫЙ ТИП ФУНКЦИЙ)
func giveMeYourName(name:String, andSecondName:String) -> String { // функиця принимает 2 строки и возвращает 1
    return "Your fill name is \(name) \(andSecondName)"
}

giveMeYourName(name: "Sergey", andSecondName: "Kutsenko")
//_______________________________________________________________________________________________
// 5. функция, принимающая массив в качестве параметра и использующая вложенную функцию для работы

func calcMoneyIn(array: [Int]) -> Int {
    var sum = 0
    func sayMoney() {
        print(sum)
    } // функция внутри функции "ВЛОЖЕННАЯ ФУНКЦИЯ"
    for item in array {
        sum += item
    }
    sayMoney()
    return sum
}

calcMoneyIn(array: [1, 2, 3, 4, 5])

// 6. функция, которая принимает переменное число параметров / функция которая имеет вариативные параметры внутри себя

func findSum(ofIntegers integers: Int...) -> Int { // найти сумму целочисленых значений
    var sum = 0
    for item in integers { // почему есть два имени ofIntegers  и integers ? -   есть два имени внутреннее и внешее, внутреннее integers используется внути самой функции вкачестве вариативного параметра  а ofIntegers  испольщуется при чтении самой функции
        sum += item
    }
    return sum
}
 findSum(ofIntegers: 2, 4, 6)

// 7. имена параметров функции
// пример
func sum(_:Int) -> Int {
    return 10
}
// 8. функция в качестве возвращаемого значения (посчитаем сколько раз я сомневался в принятии какого решения)

func whatToDo (missed: Bool) -> (Int) -> Int {
    func missCountUP(input: Int) -> Int { return input + 1}
    func missCountDown(input: Int) -> Int { return input + 1}
    return missed ? missCountUP : missCountDown
}
var missedCount = 0
missedCount = whatToDo(missed: true) (missedCount)

missedCount = whatToDo(missed: false) (missedCount)


// ДАЛЕЕ БУДУТ ЗАМЫКАНИЯ ИЛИ КЛОУЖЕРЫ (это тежи функции но у них не бывает имен, т.е. это ОБОСОБЛЕННЫЙ кусок кода но без своего имени, могут называться ЛЯМБДАМИ или БЛОКАМИ)

// далее будет пример использования:

func repeatThreeTimes (closure: ()->() ) { // наш тип  CLOSURE ничего не принимает и ничего не возвращает
    for _ in 0...2 { //  _ это нижнее подчеркивание, его применяют когда не хотят давать имя
        closure()
    }
}
repeatThreeTimes {
    () -> () in
print("Hello World")
}

// далее будет более сложный пример
let unsortedArray = [123, 2, 32, 67, 8797, 432]
let sortedArray = unsortedArray.sorted {
    (nuber1: Int , nuber2: Int) -> Bool in
    return nuber1 > nuber2 // массив сортируется по убыванию
}

// ДАЛЕЕ БУДУТ КОРТЕЖИ

let one = 1
let two = 2
let three = 3
 (one, two, three) // создали кортеж

//далее будет следующий пример
let boy = (5, "Sergey") // в одну константу поставили 2 значения
boy.1

// далее будет следующий пример (присвоим нескольким константам несколько значений)

let (first, second, third) = (1, 2, 3)

first
second
third

// следующий случай кортежа

let greenPencil = (color: "green", lenght: 20, weight: 4) // тут мы все присваиваем все в greenPencil
let (greenPencilColor, greenPencilLenght, greenPencilWeight) = greenPencil // а тут мы уже все присвоили уже в greenPencil
greenPencil.weight
greenPencil.color
greenPencil.lenght

// далее будет еще один пример

let agesAndNames = ["Misha":29, "Kostya":90, "Mira":30]
var age = 0
var name = ""
for (nameInD, ageInD) in agesAndNames {
    if age < ageInD {
       age = ageInD
       name = nameInD
    }
}
age
name

// ДАЛЕЕ БУДУТ ОПЦИОНАЛЫ (ОДНА ИЗ ГЛАВНЫХ ОСОБЕННОСТЕЙ ЯЗЫКА swift- это такие переменные котоыре могут иметь значение равное NILL (NILL -  это полное отсутствие какого значения))
var fuel : Int?
fuel = 20
//fuel = nil
// print("\(fuel!) liters left") // без восклицательного знака будет писаться слово  OPTIONAL

if let availableFuel = fuel { // это опциональная привязка, она позволяет извлечь значение
    print("\(availableFuel) liters left")
} else {
    print ("no fuel data available")
}

func checkFuel() {
    guard let availableFuel = fuel else {
         print ("no fuel data available")
        return
    }
    print("\(availableFuel) liters left")
}
checkFuel()


// ДАЛЕЕ БУДУТ КЛАССЫ

//class Human {
//    var name = "Ivan"
//    var age: Int? = 30
//    var Hairs = true
//
//    func description() -> String { // это медот
//
//        if let humanAge = age {
//        return "Hello! My name is \(name) and I'am \(age) years old"
//        } else {
//        return "Hello! My name is \(name)"
//}
//    }
//}
//
//let humanOne = Human()
//humanOne.name = "Natasha"
//humanOne.name
//humanOne.description()
//
//let humanTwo = Human()
//humanTwo.Hairs = false
//humanTwo.name = "Jack"
//humanTwo
//
//// создаем массив из Human's
//
//var array =  [Human]()
//array.append(humanOne)
//array.append(humanTwo)

// ДАЛЕЕ БУДУТ ИНИЦИАЛИЗАТОРЫ КЛАССОВ_____ (это процесс осздания экземляра ) init - обозначение инициализаторов

class Human {
    var name : String
    var age: Int? //  без занчение 30 или иного , его значение по умолчанию будет nill  - т/е/ полное отсутствие значений
    var hairs : Bool

    func description() -> String { // это медот

        if let humanAge = age {
        return "Hello! My name is \(name) and I'am \(age) years old"
        } else {
        return "Hello! My name is \(name)"
}
    }
    init (){ // это инициализатор
        name = "Ivan"
        hairs = true
    }
    init (name: String, age:Int?, hairs: Bool){ // далее будет еще один нициализатор
        self.name = name // self  значит определет что вы обращаетесь к свойству
        self.age = age
        self.hairs = hairs

    }

}

let human = Human()
human.age
human.name

let human1 = Human(name: "Jason", age: 40, hairs: true) //  новый пример инициализаторв

