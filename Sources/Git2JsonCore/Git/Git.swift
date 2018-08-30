import Foundation
import SwiftShell

struct Git {
    let command: String

    private init(arguments: [String?]) {
        let command = [Git.baseCommand] + arguments
        self.command = command.compactMap { $0 }.joined(separator: " ")
    }

    func run(directory: URL = URL(fileURLWithPath: #file).deletingLastPathComponent()) throws -> [Commit] {
        var context = CustomContext(main)
        context.currentdirectory = directory.path

        let output = context.run(bash: command).stdout
        return try Commit.decodeMultiple(from: output)
    }
}

extension Git {
    static var baseCommand: String {
        return "git --no-pager log --raw --numstat --pretty='\(Commit.gitPrettyFormat)'"
    }
}

extension Git {
    init(from commit: String? = nil, commits: Int? = nil) {
        self.init(
            arguments: [commit, commits.map { "-\($0)" }]
        )
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
