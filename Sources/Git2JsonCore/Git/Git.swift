import Foundation
import SwiftShell

struct Git {
    var command: String

    private init(arguments: [String?]) {
        let command = [Git.baseCommand] + arguments
        self.command = command.compactMap { $0 }.joined(separator: " ")
    }
}

extension Git {
    private static var baseCommand: String {
        return "git --no-pager log --raw --numstat --pretty='\(Commit.gitPrettyFormat)'"
    }
}

extension Git {
    public init() {
        self.init(arguments: [])
    }

    public init(from commit: String? = nil, commits: Int? = nil) {
        self.init(
            arguments: [commit, commits.map { "-\($0)" }]
        )
    }

    public init(compareTo remoteBranch: String = "origin/master") {
        self.init(
            arguments: []
        )
    }

    public func rawOutput(directory: URL = URL(fileURLWithPath: #file).deletingLastPathComponent()) -> String {
        var context = CustomContext(main)
        context.currentdirectory = directory.path
        return context.run(bash: command).stdout
    }

    public func run(directory: URL = URL(fileURLWithPath: #file).deletingLastPathComponent()) throws -> [Commit] {
        return try Commit.decodeMultiple(from: rawOutput(directory: directory))
    }

    public static func run(from log: String) throws -> [Commit] {
        return try Commit.decodeMultiple(from: log)
    }
}

private extension Optional {
    func map<T>(transformation: (Wrapped) -> (T)) -> T? {
        switch self {
        case .none: return nil
        case let .some(value): return transformation(value)
        }
    }
}
