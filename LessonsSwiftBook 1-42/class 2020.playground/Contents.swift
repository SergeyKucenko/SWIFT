import UIKit

class Human {
    var name = "Sergey"
    var age : Int? = 34 //  опциональное значение 
    var hairs = true
    
    func description () -> String {
        return " Hello! My name is \(name) and I'am \(age) years old ! "

    }
    
}

let humanOne = Human ()

humanOne.age
humanOne.name = "Nikolay"
humanOne.description()
humanOne.name
