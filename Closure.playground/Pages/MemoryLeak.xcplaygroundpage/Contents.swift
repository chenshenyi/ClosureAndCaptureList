//: [Previous](@previous)

import Foundation

protocol DownloadManager {
    func download(completion: @escaping (Data?) -> Void)
    // it might take a long time to download
}

// memory leak
class DownloadPageViewModel {
    let downloadManager: DownloadManager
    
    var data: Data?
    
    init(downloadManager: DownloadManager) {
        self.downloadManager = downloadManager
    }
    
    func download() {
        downloadManager.download { [self] data in
            self.data = data
        }
    }
}

// solution
class DownloadPageViewModel2 {
    let downloadManager: DownloadManager
    var data: Data?
    
    init(downloadManager: DownloadManager) {
        self.downloadManager = downloadManager
    }
    
    func download() {
        downloadManager.download { [weak self] data in
            self?.data = data
        }
    }
}

// we don't need capture if the closure is not escaping.
class Calculator {
    var answer: Int = 0

    func sum(array: [Int]) {
        array.forEach { num in
            answer += num
        }
    }
}

// test
class TroubleStudent {
    var late = 0
    
    func checkAttendance(resignHandler: () -> Void) {  // should we add @escaping?
        if late > 30 {
            resignHandler()
        }
    }
}

class Teacher {
    var isSavedTrouble = false
    
    func checkRedAttendance() {
        let red = TroubleStudent()
        red.late = 28
        red.checkAttendance { // should we capture isSavedTrouble?
            isSavedTrouble = true
        }
    }
}

//: [Next](@next)
