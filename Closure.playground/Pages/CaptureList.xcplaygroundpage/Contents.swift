//: [Previous](@previous)

import Foundation

typealias IntHandler = (Int) -> Int

var a = 0

let closure: IntHandler = { b in
    a + b
}


// capture class properties
class MyClass {
    var a = 0
    
    func doSomething() {
        var b = 0
        
        let closure: IntHandler = { [a] c in
            a + b + c
        }
    }
}

// capture self
class MyClass2 {
    var a = 0
    var b = 0
    
    func doSomething() {
        let closure: IntHandler = { [self] c in
            a + b + c
        }
    }
}

// Directly referring to `self`
class MyClass3 {
    var a = 0
    
    func doSomething() {
        let closure: IntHandler = { b in
            self.a + b
        }
    }
}

//: [Next](@next)
