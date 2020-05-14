import Foundation

struct Person {
    let name: String
    
    func sayHi() {
        print("Hi, \(name)!")
    }
}

let buddy = Person(name: "Matt")
buddy.sayHi()
print(buddy[keyPath: \Person.name])

struct Coffee {
    var type: String
    
    func taste() {
        print("Enjoy \(type)!")
    }
}

var coffee = Coffee(type: "Mocha")
coffee.taste()
coffee[keyPath: \Coffee.type] = "Latte"
coffee.taste()
