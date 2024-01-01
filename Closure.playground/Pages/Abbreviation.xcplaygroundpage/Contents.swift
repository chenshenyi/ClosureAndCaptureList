//: [Previous](@previous)

import Foundation

func execute(handler: (Int) -> Int) {
    print(handler(1))
}

// #1 the complete way of writing
execute(handler: { (num: Int) -> Int in
    return num + 1
})

// #2 ignore types
execute(handler: { num in
    return num + 2
})

// #3 ignore `return`
execute(handler: { num in
    num + 3
})

// #4 trailing closue
execute { num in
    num + 4
}

// #5 shorthand parameter
execute { $0 + 5 }

// #6 ignore unused parameter
execute { _ in
    6
}

// MARK: Two or more closures as parameter.

typealias Handler = () -> Void

func doSomethingWithClosure(closure1: Handler, closure2: Handler) {
    closure1()
    closure2()
}

doSomethingWithClosure {
    print("closure1")
} closure2: {
    print("closure2")
}

//: [Next](@next)
