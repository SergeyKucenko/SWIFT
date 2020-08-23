import UIKit

// ДАЛЕЕ БУДЕТ  ARC ( это механизм который позволяет освобождать память ) - пропустил 32 и 33 / нихуя не понял, пока мне рано это понимать///

// ДАЛЕЕ БУДЕТ 34. Опциональные цепочки
 
class Person {
  let job: Job? = Job()
  let workers: [Worker]? = [Worker()] // знак ? - означает опциональность
}

class Worker {
  let name = "Petya"
  
  func work(){
    print("I do some job")
  }
}

class Job {
  let salary: Salary? = Salary()
}

class Salary {
  let salary = 100000
  
  func showSalary() -> String {
    return "\(salary)"
  }
}

let person = Person()   //  1 варинат
if let job = person.job {
    if let salary = job.salary{
        salary.salary
    }
}

if let job = person.job , let salary = job.salary{ // 2 варинат ТОЖЕ САМОЕ что и первый но короче
    salary.salary
}
 
// 3 варинат как раз он называется ОПЦИОНАЛЬНОЙ ЦЕПОЧКОЙ !!!

let salary = person.job?.salary?.showSalary() // мы можем узнать какая у человека зарплата только если у него его раболта и зарплата

//далее попробуем создать массив и поместить туда работников

var workersArray = person.workers
workersArray?.append(Worker())
workersArray


// ДАЛЕЕ БУДЕТ 35. Обработка ошибок и отложенные действия(ERROR HANDLING)

enum PossibleErrors: Error {
    case notInStock
    case notEnoughtMoney
}

struct Book{
    let price: Int
    var count: Int
}

class Library {
    
    var deposit = 11
    var libraryBooks = ["Book1": Book (price: 10, count: 1), "Book2": Book (price: 11, count: 0), "Book3": Book(price: 12, count: 3 )] // так выглядит почленный инициализатор
    
    func getTheBook (withName: String) throws {
        guard var book = libraryBooks[withName] else {
            throw PossibleErrors.notInStock
        }
        
        guard book.count > 0 else {
            throw PossibleErrors.notInStock
        }
        
        guard book.price <= deposit else {
            throw PossibleErrors.notEnoughtMoney
        }
        
        deposit -= book.price
        book.count -= 1
        libraryBooks[withName] = book
        print ("You got the Book \(withName)")
    }
}

let library = Library()

try? library.getTheBook(withName: "Book1") // знак вопроса это опциональный варинат, тут меняем номер книги и тогда понимаем хватает ли нам деенг на книгу или нет

library.deposit // проверяем остаток
library.libraryBooks // показывает остаток, так как выше выбрана  Book1, то и остаток/count 0

do {
    try library.getTheBook(withName: "Book1")
} catch PossibleErrors.notInStock {
    print ("Book is not in Stock")
} catch PossibleErrors.notEnoughtMoney {
    print ("Not enough money")
}

// далее будет будет альтернативная запись для опцилнально try? (пример выше)
 
func doConection() throws -> Int {
    return 10
}

let x = try? doConection()
// альтернативный вариант записи выше

let y:Int?
do {
    y = try doConection()
} catch {
    y = nil
}
// далее будет пример с отложенными действиями

var attempt = 0
func whateverFunc (param: Int) -> Int {
    defer { // defer - это отложенные действуя и они выполянеются в самую последнюю очередь в независимости от того в каком месте(начало, середина) они вставленны. Но если их несколько то они выполняются с низу в верх , в нашемпримере от 10 к 2
        attempt += 2
    }
    
    defer {
        attempt *= 10
    }
    switch param {
    case 0: return 100
    case 1: return 200
    default:return 400
            }
}

whateverFunc(param: 1)
attempt

// ДУЛЕЕ БУДУТ 36. Сабскрипты (этодругими словами ИНДЕКС )

let array = [1,2,3,4] // пример использования в массиве
array[1]
 // пример испорлзования в СТРУТУРАХ

struct WorckPlace {
    var workPlace: [String]
    subscript(index:Int) -> String? {// subscript - ключевое слово при создании Сабскрипта
        get{
            switch index {
            case 0..<workPlace.count: return workPlace[index]
            default: return nil
            }
        }
        set{
            switch index {
            case 0..<workPlace.count: return workPlace[index] = newValue ?? ""
            default: break
            }
        }
    }
}
// далее содаем экземпляр нашей струтуры

var work = WorckPlace(workPlace: ["char", "armchar", "lamp"])
work.workPlace[1]
work[1]



// ДАЛЕЕ БУДУТ 37. Расширения/ Extensions ( расширения спользуятля для того чтобы можно было расщить существующий функционал уже существующего типа)

extension Int { // расширения не могут иметь свойства хранения и ленивые свойства, однако вычесляемые свой свойства и методы они используют
    
    var isEven: Bool {
        return self % 2 == 0 ? true : false  //  это оператор остатка от деления
    }
    
}

let f = 11

f.isEven


// ДАЛЕЕ БУДУТ 38. Протоколы (это минимальный набор требований которые предьявляются к классу,структуре или перечислению)

protocol Driver {
    
    var car: Bool {get}
    var license: Bool {get}
    
    func toDrive() -> Bool
}

class FirmDriver: Driver {
   let license = true
   let car = true
    
    func toDrive() -> Bool {
return true
    }
}

let firmDriver  = FirmDriver()
firmDriver.license

// далее будут 39. Универсальные шаблоны / generics  (суть/ вместо этого типа может быть другой)

class A {

}

let arrayN = [1, 2, 3, 4]
let arrayStr = ["one", "two", "three"]
let arrayCls = [A(), A(), A()]
let arr = Array <Int> ()

//func ParamValue (param: Int) -> String { //функция которая принимает какоето значение в тип ИНТЕЖЕР и потом возвращает его в виде строки
//    return "\(param)"
//}

//____ далее будет аналогичная той что выше функция, только она будет принимать строку и возвращать тоже строку

//func paramValue (param: String) -> String {
//    return param
//}

// обе ФУНКЦИИ выше абсолютно одинаковые но у них разные ТИПЫ входных параметров STRING / Int
//paramValue(param: "string")

// далее будет одна ФУНКЦИЯ в которую можно помещать различные типы параметров 

func paramValue <T>(param:T) -> String { // это как раз и есть ФУНКЦИЯ  универсального типа !!!
    return "\(param)"
}

paramValue(param: 5 )
paramValue(param: "C'mon" )
paramValue(param: true )

// далее мы создадим структуру которая будет иметь сраду ДВА универсальных ТИПА

struct HelpFulFunctions <T, U> {
    func paramValue(param:T, param2: U) -> String {
          return "\(param), \(param2)"
    }
}

let example = HelpFulFunctions < String, Int> ()
example.paramValue(param: "String1", param2: 5)

// далее будет еще один пример, напишем фунция которая меняет местами значеия двух входных параметров

var a = "b"
var b = "a"

func swappy<T> (a: inout T, b: inout T) {
    let temp = a
    a = b
    b = tepm
}

swap(&a, &b)
a
b


// ДАЛЕЕ БУДЕТ 40. Обновление Swift 4

// проверка номер 2 гита 
