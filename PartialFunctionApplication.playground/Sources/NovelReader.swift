import Foundation

public enum MatchStrategy {
    /// eg: "Hi, John!" for substring: "Hi"
    case startWith
    
    /// eg: "Hi, John!" for substring: "John!"
    case endWith
    
    /// eg: "Hi, John!" for substring: "Jo"
    case contain
}

public class NovelReader {
    var text: String?

    public init() {}
    
    public func load(filename: String) {
        guard let url = Bundle.main.url(forResource: filename, withExtension: "txt"),
              let data = try? Data(contentsOf: url) else { return }
        text = String(data: data, encoding: .utf8)
    }
    
    /// Print first k lines of loaded text.
    public func concatenate(_ k: Int) {
        guard let text else { return }
        let lines = text.split(separator: "\n")
        let number = min(lines.count, k)
        lines[..<number].forEach { print($0) }
    }
    
    func getPattern(strategy: MatchStrategy, substring: String) -> String {
        switch strategy {
        case .endWith: ".*" + substring + ".\n"
        case .startWith: "\n" + substring + ".*"
        case .contain: ".*" + substring + ".*"
        }
    }
    
    /// Find the paragraph in novel
    public func find(strategy: MatchStrategy, substring: String, _ k: Int) -> [String] {
        guard let text else { return [] }
        
        let pattern = getPattern(strategy: strategy, substring: substring)
        let range = NSRange(location: 0, length: text.utf16.count)
        let regex = try! NSRegularExpression(pattern: pattern)

        let matches = regex.matches(in: text, range: range)
            .compactMap { Range($0.range, in: text) }
            .map { String(text[$0].trimmingCharacters(in: .newlines)) }
        let firstAmount = min(matches.count, k)
        return Array(matches[..<firstAmount])
    }
}
