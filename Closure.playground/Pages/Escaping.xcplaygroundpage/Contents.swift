//: [Previous](@previous)

import Foundation


typealias Handler = () -> Void

var closures: [Handler] = []

func appendClosure(closure: @escaping Handler) {
    closures.append(closure)
}

// MARK: - Async

func doSomethingAsync(closure: @escaping Handler) {
    DispatchQueue.main.async {
        closure()
    }
}

// MARK: - Optional
var handler: Handler? = nil

func doSomethingOptional(closure: Handler?) {
    handler = closure
}


// MARK: - Test
func doSomething(closure: Handler) { // should we add @escaping?
    Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
        closure()
    }.fire()
}

//: [Next](@next)
