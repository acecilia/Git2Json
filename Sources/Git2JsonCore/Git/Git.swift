import Foundation
import SwiftShell

public struct Git {
    private var cmd: String

    private init(_ cmdComponents: [CustomStringConvertible]) {
        self.cmd = cmdComponents.map { $0.description }.joined(separator: " ")
    }
}

extension Git {
    private static var baseLogCmdComponents: [CmdComponent] {
        return [.git, .noPager, .log, .raw, .numstat, .pretty(format: Commit.gitPrettyFormat)]
    }

    private static var baseDiffCmdComponents: [CmdComponent] {
        return [.git, .noPager, .diff, .raw, .numstat]
    }
}

extension Git {
    public static func log(_ arguments: LogCmdComponent...) -> Command<[Commit]> {
        var cmdComponents: [CustomStringConvertible] = baseLogCmdComponents
        cmdComponents.append(contentsOf: arguments)
        return Command(cmdComponents)
    }

    public static func diff(_ arguments: DiffCmdComponent...) -> Command<[Change]> {
        var cmdComponents: [CustomStringConvertible] = baseDiffCmdComponents
        cmdComponents.append(contentsOf: arguments)
        return Command(cmdComponents)
    }
}


