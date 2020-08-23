import UIKit

// 1. простая функция, ничего не принимающая и ничего не возвращающая
func sayHello () {
    print("Hello")
}
sayHello()

// 2. функция, принимающая один параметр
func oneParam (param: Int ) {
    var param = param
    param += 1
    
}
oneParam(param: 11)

// 3. функция, не принимающая один параметр, но возвращающая значение

func returnValue() -> Int {
    let c = 10
    return c
}
let a = returnValue()
a

// 4. функция, принимающая несколько параметров и возвращающая значение

func giveMeYour(name: String, andSecondName: String) -> String {
    return "Your full name is a \(name) \(andSecondName)"
}
giveMeYour(name: "Oleg", andSecondName: "Nikolaevich")

// 5. функция, принимающая массив в качестве параметра и использующая вложенную функцию для работы

func calcMoneyIN (array: [Int]) -> Int {
    var sum = 0
    func sayMoney(){
        print (sum)
    }
    for item in array {
        sum += item
    }
    sayMoney()
    return sum
    
}

calcMoneyIN(array:[1, 2, 3, 4, 5])

// 6. функция, которая принимает переменное число параметров
func findSumm (ofIntegers inregers: Int...) -> Int {
    var sum = 0
    for item in inregers{
        sum += item
    }
    return sum
}

findSumm(ofIntegers: 1, 2, 3)

// 7. имена параметров функции

func sum (_:Int) -> Int {
    return 10
}

// 8. функция в качестве возвращаемого значения

func whatToDo (missed: Bool) -> ((Int)->Int){
    func missCountUp (input: Int) -> Int {return input + 1 }
    func missCountDown (input: Int) -> Int {return input - 1 }
    return missed ?  missCountUp : missCountDown
}
var missedCout = 0
missedCout = whatToDo(missed: false) (missedCout)
whatToDo(missed: true) (0)
