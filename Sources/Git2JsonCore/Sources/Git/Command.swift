import Foundation
import SwiftShell

public struct Cmd<Result> {
    public var cmd: String

    init(_ cmdComponents: [CustomStringConvertible]) {
        cmd = cmdComponents.map { $0.description }.joined(separator: " ")
    }
}

extension Cmd {
    public func rawOutput(directory: URL = URL(fileURLWithPath: #file).deletingLastPathComponent()) -> String {
        var context = CustomContext(main)
        context.currentdirectory = directory.path
        return context.run(bash: cmd).stdout
    }
}

public extension Cmd where Result == [Commit] {
    public func run(directory: URL = URL(fileURLWithPath: #file).deletingLastPathComponent()) throws -> Result {
        return try Commit.decodeMultiple(from: rawOutput(directory: directory))
    }

    public static func run(from string: String) throws -> Result {
        return try Commit.decodeMultiple(from: string)
    }
}

public extension Cmd where Result == [Change] {
    public func run(directory: URL = URL(fileURLWithPath: #file).deletingLastPathComponent(), file: String = #file) throws -> Result {
        print("DIRECT: " + directory.path)
        print("DIRECT2: " + file)
        return try Change.decodeMultiple(from: rawOutput(directory: directory))
    }

    public static func run(from string: String) throws -> Result {
        return try Change.decodeMultiple(from: string)
    }
}
