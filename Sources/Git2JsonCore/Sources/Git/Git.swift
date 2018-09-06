import Foundation
import SwiftShell

public struct Git { }

extension Git {
    private static var baseLogCmdComponents: [CmdComponent] {
        return [.git, .noPager, .log, .raw, .numstat, .pretty(format: Commit.gitPrettyFormat)]
    }

    private static var baseDiffCmdComponents: [CmdComponent] {
        return [.git, .noPager, .diff, .raw, .numstat]
    }
}

extension Git {
    public static func log(_ arguments: LogCmdComponent...) -> Cmd<[Commit]> {
        var cmdComponents: [CustomStringConvertible] = baseLogCmdComponents
        cmdComponents.append(contentsOf: arguments)
        return Cmd(cmdComponents)
    }

    public static func diff(_ arguments: DiffCmdComponent...) -> Cmd<[Change]> {
        var cmdComponents: [CustomStringConvertible] = baseDiffCmdComponents
        cmdComponents.append(contentsOf: arguments)
        return Cmd(cmdComponents)
    }
}


