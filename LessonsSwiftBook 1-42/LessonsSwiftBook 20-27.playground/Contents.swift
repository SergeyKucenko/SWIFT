import UIKit


//  ДАЛЕЕ БУДЕТ ОЧЕНЬ ВАЖНАЯ ТЕМА _НАСЛЕДОВАНИЕ_ (наследование происходить исключительно между классами)

class Human { // это super КЛАСС ___
    var name : String   // properties - это свойства
    
  func tellAboutME() -> String { // metod - это МЕТОД
        return "Hello! My name is \(name) !"
    }
    init(name: String){ // initializer - это инициализатор
        self.name = name
    }
}
// далее будет еще один класс который будет наследовать свойства класса HUMAN

class Child: Human { // child - явлется подклассом___
    var toy = "Horse"
    
    override func tellAboutME() -> String { // переопределение метода
        let originalText = super.tellAboutME() // super класс это тот клас от которого этот клас наследует свои свойства
        return originalText + " And I have a toy \(self.toy) "
    }
    init (toy: String, name: String) {
        self.toy = toy
        super.init(name: name)
    }
    override init(name: String) {
        self.toy = "Hummer"
        super.init(name: name)
    }
}

let child = Child (name: "Klava")
child.tellAboutME()
child.toy

let child1 = Child(toy: "Dinosaur", name: "Max")
child1.tellAboutME()
// можно и предотвратить наследование(ключевое слово  FINAL. ставится перед классом или методом например поставить FINAL перед func tellAboutME() -> String , тогда далее нивего не будет наследоваться классом ...   )



// ДАЛЕЕ БУДУТ ВЫЧЕСЯЛЕМЫЕ СВОЙСТВА (СВОЙСТВА КОТОРЫЕ ВЫЧЕСЛЯЮТ СВОЕ ЗНАЧЕНИЕ)


class Rectangular {
    let height: Int
    let width: Int
    let depth: Int
    
    var volume: Int {// далее будут вычисляемые свойства  и это всегда переменные
        return height * width * depth // вычисляем объем фигуры
    }
    
    init (height: Int, width: Int, depth: Int){ // это инизиализатор в котором будут описанны все свойства
        self.height = height
        self.width = width
        self.depth = depth
    }
}

let rect = Rectangular(height: 10, width: 12, depth: 13)
rect.volume

// далее будет еще один пример

class Person {
    var name: String
    var secondName: String
    
    var fullName: String {
        get {return name + " " +  secondName // вместо одного + пришлось написать конструкцию + " " + , благодаря ей будет пробел между именами , без нее все будет слитно
        }
        set(anotherNewValue) {
            let array = anotherNewValue.components(separatedBy: " ")
            name = array[0]
            secondName = array [1]
            }
        }
    init (name: String, secondName: String){
        self.name = name
        self.secondName = secondName
    }
}
let person = Person(name: "Ivan", secondName: "Ivanovich")
person.fullName

person.name
person.secondName
person.fullName = "Zinaida Petrova"
person.name
person.secondName

// ДАЛЕЕ БУДУТ СВОЙСТВА КЛАССОВ

class Car {
    // properties
    let products: Int
    let people: Int
    let pets: Int
    class var selfWeight : Int { return 1500 }
    class var maxWeight : Int { return 2000 }
  
    var totalWeight: Int{   // computed property - текущий вес
        return products + people + pets + Car.selfWeight
    }
    // initializer
    init (products: Int, people:Int, pets:Int) {
        self.products = products
        self.people = people
        self.pets = pets
    }
}

let car = Car (products: 30, people: 300, pets: 50)
car.totalWeight

// далее будут примеры работы со свойствами

let maxWeight = Car.maxWeight
let carWeight = Car.selfWeight
let totalWeight = car.totalWeight

if maxWeight < totalWeight {
    print ("You cant drive, because car is overloaded!: \(totalWeight - maxWeight)")
} else{
    print ("you can drive! ")
}

// ДАЛЕЕ БУДУТ ЛЕНИВЫЕ СВОЙСТВА (это такое свой ство которые не инициализируется пока к нему не обратятся, имеет ключевое слово  LAZY)

func bigDataProcessingFunc() -> String {
  return "very long process"
}

class Processing {
  let smallDataProcessing = "small data processing"
  let averageDataProcessing = "average data processing"
  lazy var bigDataProcessing = bigDataProcessingFunc()
}
 
let process = Processing()
process.bigDataProcessing
process

// ДАЛЕЕ БУДУТ НАБЛЮДАТЕЛИ СВОЙСТВА (они наблюдают за измениниями значения свойств)

class SecretLabEmploye {
    
    var accessLevel = 0 { // здесь открыыает тело нашего свойства
        willSet(newValue) { // это будет установленно
            print ("new boss is about to come")
            print ("new access level is \(newValue)")
        }
        didSet{ // это было установленно
            if accessLevel > 0 {
             accessToBB = true
            } else {
                accessToBB = false
            }
        print ("new boss just come")
        print ("last time a had access level  \(oldValue)")
        }
    }
    var accessToBB = false
}

let employee = SecretLabEmploye()
employee.accessLevel
employee.accessToBB

// далее меняем значения
employee.accessLevel  = 1
employee.accessToBB

// ДАЛЕЕ БУДУТ АЛИАСЫ ТИПОВ (ПСЕВДОНИМЫ ТИПОВ)

typealias Meter = Int

let leight: Meter = 50

let lenght1 = 20

let sum: Meter = leight + lenght1
print("suma")
// еще одни пример
typealias DoubleInterg = (Int, Int)
let somuConstant = (1, 2) // это мы записали КОРТЕЖ
// следующий пример (как заменить тип словаря)
typealias DictionatyType = [String: Int]
var dictionary: DictionatyType = [:]
dictionary["Appartment 123"] = 123
dictionary

// ДАЛЕЕ БУДУТ ПЕРЕЧИСЛЕНИЯ или ЭНУМЫ (ЭНУМЫ(типы первого класса в свифт) - обьединяют в себе привязанные значения и привязывают им один общий тип)
// далее будет пример из игры где персонажу можно двигаться только в оределенные стороны

enum Movement {// энум всегда пищется с большой буквы
    case forward  // case  - это основная состовная часть энума
    case backward
    case left
    case right
}
let movemetDirection: Movement = Movement.backward

// далее будет  пример энума с двумя кейсами и одним вычесляемый свойством

enum Divice  {
    case ipad(color: String), iphone
    
    var year: Int {
        switch self{
          case .iphone: return 2007
        case .ipad(let color) where color == "black" : return 2020 //  цвет айпада долден быть черный  и если он черный то мы возвращаем 2020
          case .ipad: return 2010
        }
    }
}
let yaerOfProduction = Divice.ipad(color: "black").year

// в энумы мы можем вкладывать другие энумы (вложенные энумы )

enum Character{
    enum Weapon: Int { // вложенный энум
        case sword = 4
        case wand = 1
        
        var damage: Int {
            return rawValue * 10
        }
    }
    enum CharacterType{
        case knight
        case mage
    }
}

let charWeapor = Character.Weapon.sword.damage // узнеем урон от конретного оружия

// далее будут ИНДЕЕКТЫЕ  энумы

indirect enum Lunch {
    case salad
    case soup
    case meal (Lunch, Lunch) // в один кейс помещаем другой
}

let MyLanch = Lunch.meal(.salad, .soup)
