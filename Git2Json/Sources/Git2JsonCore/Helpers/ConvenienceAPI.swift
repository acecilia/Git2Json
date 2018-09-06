extension Array where Element == Change {
    public var additions: Int {
        return reduce(0) { $0 + $1.additions }
    }

    public var deletions: Int {
        return reduce(0) { $0 + $1.deletions }
    }

    public var addedFiles: [String] {
        return filter{ $0.status == .addition }.map { $0.path }
    }

    public var deletedFiles: [String] {
        return filter{ $0.status == .deletion }.map { $0.path }
    }

    public var modifiedFiles: [String] {
        return filter{ $0.status == .modification }.map { $0.path }
    }
}
