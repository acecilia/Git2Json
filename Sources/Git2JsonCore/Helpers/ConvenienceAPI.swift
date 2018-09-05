import Foundation

protocol ConvenienceAPI {
    var changes: [Change] { get }
}

extension ConvenienceAPI {
    var additions: Int {
        return changes.reduce(0) { $0 + $1.additions }
    }

    var deletions: Int {
        return changes.reduce(0) { $0 + $1.deletions }
    }

    var addedFiles: [String] {
        return changes.filter{ $0.status == .addition }.map { $0.path }
    }

    var deletedFiles: [String] {
        return changes.filter{ $0.status == .deletion }.map { $0.path }
    }

    var modifiedFiles: [String] {
        return changes.filter{ $0.status == .modification }.map { $0.path }
    }
}

extension Array: ConvenienceAPI where Element == Change {
    var changes: [Change] { return self }
}
