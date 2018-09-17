import Foundation
import SwiftShell

public struct Git { }

extension Git {
    public static func log(_ arguments: LogCmdComponent...) -> Cmd<[Commit]> {
        let baseLogCmdComponents: [CmdComponent] = [.git, .noPager, .log, .raw, .numstat, .pretty(format: Commit.gitPrettyFormat)]
        var cmdComponents: [CustomStringConvertible] = baseLogCmdComponents
        cmdComponents.append(contentsOf: arguments)
        return Cmd(cmdComponents)
    }

    public static func diff(_ arguments: DiffCmdComponent...) -> Cmd<[Change]> {
        let baseDiffCmdComponents: [CmdComponent] = [.git, .noPager, .diff, .raw, .numstat]
        var cmdComponents: [CustomStringConvertible] = baseDiffCmdComponents
        cmdComponents.append(contentsOf: arguments)
        return Cmd(cmdComponents)
    }

    public static var topLevel: Cmd<String> {
        let cmdComponents: [CmdComponent] = [.git, .revParse, .showTopLevel]
        return Cmd<String>(cmdComponents)
    }
}


