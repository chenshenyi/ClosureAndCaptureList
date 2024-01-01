//: [Previous](@previous)

import Foundation


func nonAutoClosure(handler: () -> Bool) {
    print(handler())
}
nonAutoClosure(handler: { 2 > 1 })

func autoClosure(handler: @autoclosure () -> Bool) {
    print(handler())
}
autoClosure(handler: 2 > 1)

// never use autoclosure
// trailing closure provides a clean syntax
nonAutoClosure { 2 > 1 }

// assert
assert(2 > 1)

//: [Next](@next)
