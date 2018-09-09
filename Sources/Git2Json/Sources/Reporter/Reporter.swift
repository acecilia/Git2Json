import Foundation

public struct Reporter {
    public static var violations: [Violation] = []

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

    public static func exit(failOnError: Bool = true) {
        if failOnError && violations.contains{ $0.severity == .error } {
            Foundation.exit(1)
        }
        Foundation.exit(0)
    }
}
