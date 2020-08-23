import UIKit

// ДАЛЕЕ БУДУТ СТРУКТУРЫ (осноные строительыне блоки нашего кода будут СТРУКТУЫ и КЛАССЫ !!!)

// 2 самых ВАЖНЫХ отличия между СТРУКТУРАМИ и КЛАССАМИ - это 1) структуры НЕ МОГУТ НАСЛЕДОВАТЬСЯ в отличие от КЛАССОВ 2)КЛАССЫ являются ССЫЛОЧНЫМ значением, СТРУКТЫРЫ являются типом ЗНАЧЕНИЯ


// simple structure/class
struct Site {
  // stored properties (свойства хранения)
  var siteName = "SwiftBook.ru"
  let visitsToday = 1000
  let visitsYesterday = 1000
  
  // computed property (вычисляемое свойство)
  var visitsTommorow: Int {
    return (visitsToday + visitsYesterday) / 2
  }
  // lazy property (ленивое свойство )
  lazy var someLazyProperty = 1 + 2
  
  func description() -> String { // обычный МЕТОД
    return "We had \(visitsYesterday) visitors yesterday. Today we have \(visitsToday) visitors. Tommorow we will have about \(visitsTommorow) visitors."
  }
}

let firstWebSite = Site ()

// далее будет функция которая позволить изменить совйства sitename (см.выше)

func changeSiteName(site: Site) -> Site {
    var site = site
    site.siteName = "iphonecoder.ru"
    return site
}

changeSiteName(site: firstWebSite)
firstWebSite.siteName

// другой пример работы СТРУКТУРЫ

// ===  это оператор ТОЖДЕСТВЕННОСТИ - он проверят принадлежат ли принадлежет ли экземпляры класса одной ячейки памяти т.е. является ли один экземпляр класса , ссылкой дуругого языка класса


// ДАЛЕЕ БУДУТ   -   Импорт фреймворков или библиотек

//import UIKit
import Foundation

let string = "hello world"

string.components(separatedBy: "") // разбивает сроку на компоненты



// ДАЛЕЕ БУДЕТ 30.  Оператор Проверка типов и  оператор приведение типов

class Furniture { // это РОДИТЕЛЬСКИЙ КЛАСС/СУПЕР КЛАСС,   мебель ("каждый шкаф явлется мебелью но некаждая мебель является обязательно шкафом" )
    let material: String
    
    init(material: String){
        self.material = material
    }
}

class Bed: Furniture{ // полки
    let numberOfPlaces: Int // количество полок
    
    init(numberOfPlaces: Int, material: String){ //  init это инициализатор
        self.numberOfPlaces = numberOfPlaces
        super.init(material: material)
        }
}

class Cupboard: Furniture{ // шкаф
    let numberOfShelves: Int // полки
    
    init (numberOfShalves: Int, material: String) {
        self.numberOfShelves = numberOfShalves
        super.init(material: material)
  }
}
var arrayOffurniture = [Furniture] ()
arrayOffurniture.append(Bed(numberOfPlaces: 2, material: "Wood"))
arrayOffurniture.append(Bed(numberOfPlaces: 1, material: "Steel"))
arrayOffurniture.append(Bed(numberOfPlaces: 2, material: "Wood"))


arrayOffurniture.append(Cupboard(numberOfShalves: 4, material: "Wood"))
arrayOffurniture.append(Cupboard(numberOfShalves: 6, material: "Steel"))
arrayOffurniture.append(Cupboard(numberOfShalves: 3, material: "Wood"))
arrayOffurniture.append(Cupboard(numberOfShalves: 5, material: "Steel"))

arrayOffurniture

var bed = 0
var cupboard = 0

//for item in arrayOffurniture{   //пишем цикл
//    if item is Bed{ // is это оператор проверки типа
//        bed += 1
//    } else {
//        cupboard += 1
//    }
//}

for item in arrayOffurniture{
//    if item is Bed {
//        let bedForSure = item as! Bed
//        bed += 1
//    }
    if let bedForSure = item as? Bed{ // это более "элегантное" написание того что закомиченно выше
        bed += 1
        bedForSure.numberOfPlaces
    }
}

bed
cupboard


// ДАЛЕЕ БУДУТ - 31. Типы AnyObject и Any ()
class A{
}

class B {
}

class C {
}

let a = A()
let b = A()
let c = A()
let d = B()
let e = C()

struct D {
}

let f = D()

enum E {
  case a
  case b
}

let g = E.b

let array: [AnyObject] = [a, b, c, d, e] // AnyObject - это тип обозначающий экземпляр любого КЛАССА
let arrayTwo: [Any] = [a, b, c, d, e, f, g, true, "String", 0.95, 5 + 4] // Any - это тип обозначающий все значения

for i in arrayTwo { // раскладываем массив типа ANY
  switch  i {
  case let item as Int:
    print("this is int")
  case let item as String:
    print("this is string")
  default:
    print("other type")
  }
}


