import Foundation

protocol Reader {
    /// Load .txt file from resources
    func load(filename: String)

    /// Print first k lines of loaded text
    func concatenate(_ k: Int)

    /// Find the matched paragraph in novel
    ///
    /// - Parameters:
    ///   - strategy: The strategy to match the substring
    ///   - substring: The string you want to match
    ///   - k: Return the first k results
    /// - Returns: The first k matched paragraph
    func find(strategy: MatchStrategy, substring: String, _ k: Int) -> [String]
}
extension NovelReader: Reader {}

let reader: Reader = NovelReader()

// load HarryPotter.txt from Resources
reader.load(filename: "HarryPotter")

// print first line to see if the resources is loaded successfully.
reader.concatenate(1)

// find first 3 matches paragragh that end with years
let results = reader.find(strategy: .endWith, substring: "years", 3)

// print the results
func printResults(results: [String]) {
    print("--------------Results-----------------")
    results.enumerated().forEach { print($0, $1, separator: ": ") }
    print("--------------------------------------\n")
}
printResults(results: results)

//: # Questions
//: ---
//: Q1: Create a function to find first 10 matches of giving strategy and substring
func first10Matched(strategy: MatchStrategy, substring: String) -> [String] {
    // write your answer here
}

let results10 = first10Matched(strategy: .endWith, substring: "years")
printResults(results: results10)

//: Q2: Create a function to find first 5 matches of giving strategy and substring
func first5Matched(strategy: MatchStrategy, substring: String) -> [String] {
    // write your answer here
}

let results5 = first5Matched(strategy: .endWith, substring: "years")
printResults(results: results5)

//: Q3: How can I use the currying pattern to improve previous functions
func firstKMatched(_ k: Int) -> (MatchStrategy, String) -> [String] {
    // write your answer here
}

let first2Matched = firstKMatched(2)
let first3Matched = firstKMatched(3)
let first4Matched = firstKMatched(4)

let result2 = first2Matched(.endWith, "years")
let result3 = first3Matched(.endWith, "years")
let result4 = first4Matched(.endWith, "years")

printResults(results: result2)
printResults(results: result3)
printResults(results: result4)

//: Bonus: How to generate functions that fix `strategy` and `first`.
//:
//: ```swift
//: first3EndWith(substring: "years")
//: first5StartWith(substring: "years")
//: ```
