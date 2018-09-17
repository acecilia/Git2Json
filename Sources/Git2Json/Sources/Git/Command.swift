import Foundation
import SwiftShell

public struct Cmd<Result> {
    public var cmd: String

    init(_ cmdComponents: [CustomStringConvertible]) {
        cmd = cmdComponents.map { $0.description }.joined(separator: " ")
    }
}

extension Cmd {
    public func rawOutput(invokingFile: String = #file) throws -> String {
        let directory = URL(fileURLWithPath: invokingFile).deletingLastPathComponent()
        var context = CustomContext(main)
        context.currentdirectory = directory.path
        let result = context.run(bash: cmd)
        if let error = result.error {
            throw error
        }
        return result.stdout
    }
}

public extension Cmd where Result == String {
    public func run(invokingFile: String = #file) throws -> Result {
        return try rawOutput(invokingFile: invokingFile)
    }
}

public extension Cmd where Result == [Commit] {
    public func run(invokingFile: String = #file) throws -> Result {
        return try Commit.decodeMultiple(from: rawOutput(invokingFile: invokingFile), gitTopLevel: Git.topLevel.run())
    }
}

public extension Cmd where Result == [Change] {
    public func run(invokingFile: String = #file) throws -> Result {
        return try Change.decodeMultiple(from: rawOutput(invokingFile: invokingFile), gitTopLevel: Git.topLevel.run())
    }
}
