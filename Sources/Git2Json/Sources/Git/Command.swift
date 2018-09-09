import Foundation
import SwiftShell

public struct Cmd<Result> {
    public var cmd: String

    init(_ cmdComponents: [CustomStringConvertible]) {
        cmd = cmdComponents.map { $0.description }.joined(separator: " ")
    }
}

extension Cmd {
    public func rawOutput(invokingFile: String = #file) -> String {
        let directory = URL(fileURLWithPath: invokingFile).deletingLastPathComponent()
        var context = CustomContext(main)
        context.currentdirectory = directory.path
        return context.run(bash: cmd).stdout
    }
}

public extension Cmd where Result == String {
    public func run(invokingFile: String = #file) -> Result {
        return rawOutput(invokingFile: invokingFile)
    }
}

public extension Cmd where Result == [Commit] {
    public func run(invokingFile: String = #file) throws -> Result {
        return try Commit.decodeMultiple(from: rawOutput(invokingFile: invokingFile))
    }

    public static func run(from string: String) throws -> Result {
        return try Commit.decodeMultiple(from: string)
    }
}

public extension Cmd where Result == [Change] {
    public func run(invokingFile: String = #file) throws -> Result {
        return try Change.decodeMultiple(from: rawOutput(invokingFile: invokingFile))
    }

    public static func run(from string: String) throws -> Result {
        return try Change.decodeMultiple(from: string)
    }
}
