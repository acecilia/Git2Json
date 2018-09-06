import Foundation

public enum Severity: String {
    case warning
    case error
}

struct Location: CustomStringConvertible {
    let file: String?
    let line: Int?
    let character: Int?

    init(file: String? = nil, line: Int? = nil, character: Int? = nil) {
        self.file = file
        self.line = line
        self.character = character
    }

    var description: String {
        // Xcode likes warnings and errors in the following format:
        // {full_path_to_file}{:line}{:character}: {error,warning}: {content}
        let fileString: String = file ?? "<nopath>"
        let lineString: String = ":\(line ?? 1)"
        let charString: String = character.map({ ":\($0)" }) ?? ""
        return [fileString, lineString, charString].joined()
    }
}

public struct XcodeReporter {
    public static func print(
        _ severity: Severity,
        file: String? = nil,
        line: Int? = nil,
        character: Int? = nil,
        message: String,
        exitOnError: Bool = true
        ) {
        let location = Location(file: file, line: line, character: character)
        let string = [
            "\(location):",
            "\(severity.rawValue):",
            "(\(message))"
            ].joined(separator: " ")
        Swift.print(string)

        if exitOnError && severity == .error {
            exit(1)
        }
    }
}
