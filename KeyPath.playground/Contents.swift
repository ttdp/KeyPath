import Foundation

class Hotel {
    var brand: String
    var star: Int
    
    init(brand: String, star: Int) {
        self.brand = brand
        self.star = star
    }
}

let hotel = Hotel(brand: "Sheraton", star: 5)
print(hotel.brand, hotel.star)   // Sheraton 5
hotel[keyPath: \Hotel.brand] = "Marriott"
hotel[keyPath: \Hotel.star] = 4
print(hotel.brand, hotel.star)   // Marriott 4

struct Hobby {
    var type: String
    
    func play() {
        print("Enjoy \(type)!")
    }
}

var hobby = Hobby(type: "Basketball")
let typeKeyPath = \Hobby.type
hobby.play()  // Enjoy Basketball!
hobby[keyPath: typeKeyPath] = "Swimming"
hobby.play()  // Enjoy Swimming!

struct Person {
    let name: String
    let hobby: Hobby
}

let person = Person(name: "John", hobby: hobby)
let nameKeyPath = \Person.name
let hobbyKeyPath = \Person.hobby
print(person[keyPath: nameKeyPath])     // John
print(person[keyPath: hobbyKeyPath])    // Hobby(type: "Swimming")

let chainedKeyPath = \Person.hobby.type
let appendedKeyPath = hobbyKeyPath.appending(path: typeKeyPath)
print(person[keyPath: chainedKeyPath])  // Swimming
print(person[keyPath: appendedKeyPath]) // Swimming

let marriott = Hotel(brand: "Marriott", star: 4)
let sheraton = Hotel(brand: "Sheraton", star: 5)
let holidayInn = Hotel(brand: "HolidayInn", star: 3)

let hotes = [marriott, sheraton, holidayInn]
print(hotes)

struct Task {
    let title: String
    let isDone: Bool
}

let tasks = [Task(title: "First", isDone: true), Task(title: "Second", isDone: false)]
let finishedTasks = tasks.filter(\.isDone)
print(finishedTasks)
