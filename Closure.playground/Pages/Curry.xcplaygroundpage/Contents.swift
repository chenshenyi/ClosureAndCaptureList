//: [Previous](@previous)

import Foundation

func sum2(_ a: Int, _ b: Int) -> Int {
    a + b
}

print(sum2(1, 2))


func currySum2(_ a: Int) -> (Int) -> Int {
    { a + $0 }
}

let add1 = currySum2(1)

print(add1(2))

// more arguments
func currySum3(_ a: Int) -> (Int) -> (Int) -> Int {
    { b in
        { c in
            a + b + c
        }
    }
}

print(currySum3(10)(11)(20))

// when to use it
protocol DownloadManager {
    func download(completion: @escaping (Data) -> Void)
}

class DownloadViewModel {
    let downloadManager: DownloadManager

    init(downloadManager: DownloadManager) {
        self.downloadManager = downloadManager
    }

    func download() {
        downloadManager.download(completion: downloadWithLimit(limit: 4e6))
        // 4e6 == 4 * 10^6 == 4MB
    }

    func downloadWithLimit(limit: Float) -> (Data) -> Void {
        { data in
            if data.count <= Int(limit) {
                print(data)
            }
        }
    }
}


//: [Next](@next)
