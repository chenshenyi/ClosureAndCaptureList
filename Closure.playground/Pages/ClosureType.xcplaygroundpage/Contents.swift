//: [Previous](@previous)

import Foundation

var closure1 = { (num: Int) -> Int in
    return num + 1
}

var colsure2: (Int) -> Int = { num in
    return num + 1
}

// ambiguous type is not allowed
var closure3 = { num in
    return num + 1
}

// use typealias to clarify usage
typealias ErrorHandler = (Error) -> Void

var errorHandler: ErrorHandler = { error in
    
}

//: [Next](@next)
