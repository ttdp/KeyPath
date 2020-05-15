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
print(hotes[keyPath: \[Hotel].[1].brand])   // Sheraton

extension Sequence {
    func sorted<T: Comparable>(on keyPath: KeyPath<Element, T>, by order: (T, T) -> Bool) -> [Element] {
        return sorted { current, next in
            order(current[keyPath: keyPath], next[keyPath: keyPath])
        }
    }
}

print(hotes.sorted(on: \Hotel.star, by: <).map { $0.brand })
// ["HolidayInn", "Marriott", "Sheraton"]

extension Sequence {
    func map<T>(_ keyPath: KeyPath<Element, T>) -> [T] {
        return map { $0[keyPath: keyPath] }
    }
}

print(hotes.sorted(on: \.star, by: >).map(\.brand))
// ["Sheraton", "Marriott", "HolidayInn"]
