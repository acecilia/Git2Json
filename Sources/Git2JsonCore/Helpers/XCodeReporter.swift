import Foundation

public enum Severity: String {
    case warning
    case error
}

public struct Location: CustomStringConvertible {
    public let file: String?
    public let line: Int?
    public let character: Int?

    init(file: String? = nil, line: Int? = nil, character: Int? = nil) {
        self.file = file
        self.line = line
        self.character = character
    }

    public var description: String {
        // Xcode likes warnings and errors in the following format:
        // {full_path_to_file}{:line}{:character}: {error,warning}: {content}
        let fileString: String = file ?? "<nopath>"
        let lineString: String = ":\(line ?? 1)"
        let charString: String = character.map({ ":\($0)" }) ?? ""
        return [fileString, lineString, charString].joined()
    }
}

public struct Violation: CustomStringConvertible {
    public let severity: Severity
    public let location: Location
    public let message: String

    public var description: String {
        // Xcode likes warnings and errors in the following format:
        // {full_path_to_file}{:line}{:character}: {error,warning}: {content}
        return [
            "\(location): ",
            "\(severity.rawValue): ",
            "\(message)"
            ].joined()
    }
}

public struct XcodeReporter {
    public private(set) static var violations: [Violation] = []

    public static func print(
        _ severity: Severity,
        file: String? = nil,
        line: Int? = nil,
        character: Int? = nil,
        _ message: String
        ) {
        let location = Location(file: file, line: line, character: character)
        let violation = Violation(severity: severity, location: location, message: message)
        violations.append(violation)
        Swift.print(violation)
    }

    public static func finish(exitOnError: Bool = true) {
        if exitOnError && violations.contains{ $0.severity == .error } {
            exit(1)
        }
        exit(0)
    }
}
