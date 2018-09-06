import Foundation

private protocol ConvenienceAPI {
    var changes: [Change] { get }
}

extension ConvenienceAPI {
    public var additions: Int {
        return changes.reduce(0) { $0 + $1.additions }
    }

    public var deletions: Int {
        return changes.reduce(0) { $0 + $1.deletions }
    }

    public var addedFiles: [String] {
        return changes.filter{ $0.status == .addition }.map { $0.path }
    }

    public var deletedFiles: [String] {
        return changes.filter{ $0.status == .deletion }.map { $0.path }
    }

    public var modifiedFiles: [String] {
        return changes.filter{ $0.status == .modification }.map { $0.path }
    }
}

extension Array: ConvenienceAPI where Element == Change {
    fileprivate var changes: [Change] { return self }
}

/* Not possible as of Swift 4.2
extension Array: ConvenienceAPI where Element == Commit {
    fileprivate var changes: [Change] { return self[0].changes }
}
*/
