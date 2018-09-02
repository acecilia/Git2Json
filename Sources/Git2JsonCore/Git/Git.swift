import Foundation
import SwiftShell

struct Git {
    var cmd: String

    private init(_ extraCmdComponents: [CmdComponent]) {
        let cmdComponents = Git.baseCmdComponents + extraCmdComponents.compactMap { $0 }
        self.cmd = cmdComponents.map { $0.description }.joined(separator: " ")
    }
}

extension Git {
    private static var baseCmdComponents: [CmdComponent] {
        return [.git, .noPager, .log, .raw, .numstat, .pretty(format: Commit.gitPrettyFormat)]
    }
}

extension Git {
    public init() {
        self.init([])
    }

    public static func list(_ commits: Int) -> Git {
        return Git([.logCommitCount(commits)])
    }

    public static func listBefore(_ revision: String) -> Git {
        return Git([.revision(revision)])
    }

    public static func listBefore(_ revision: String, commits: Int) -> Git {
        return Git([.logCommitCount(commits), .revision(revision)])
    }

    public static func listAgainstTarget(_ target: String) -> Git {
        return Git([.logRevisionRange(source: "HEAD", target: target)])
    }

    public static func customArgs(args: [String]) -> Git {
        return Git(args.map { CmdComponent.custom($0) })
    }
}

extension Git {
    public func rawOutput(directory: URL = URL(fileURLWithPath: #file).deletingLastPathComponent()) -> String {
        var context = CustomContext(main)
        context.currentdirectory = directory.path
        return context.run(bash: cmd).stdout
    }

    public func run(directory: URL = URL(fileURLWithPath: #file).deletingLastPathComponent()) throws -> [Commit] {
        return try Commit.decodeMultiple(from: rawOutput(directory: directory))
    }

    public static func run(from log: String) throws -> [Commit] {
        return try Commit.decodeMultiple(from: log)
    }
}
