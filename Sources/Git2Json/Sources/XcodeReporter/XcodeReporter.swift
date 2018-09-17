import Foundation

public class XcodeReporter {
    public var violations: [Violation] = []

    public init() {}
    
    public func error(
        file: String? = nil,
        line: Int? = nil,
        character: Int? = nil,
        _ message: String
        ) {
        printViolation(.error, file: file, line: line, character: character, message)
    }

    public func warning(
        file: String? = nil,
        line: Int? = nil,
        character: Int? = nil,
        _ message: String
        ) {
        printViolation(.warning, file: file, line: line, character: character, message)
    }

    public func finish(failOnError: Bool = true) {
        if failOnError && violations.contains { $0.severity == .error } {
            Foundation.exit(1)
        }
        Foundation.exit(0)
    }

    // MARK: private
    
    private func printViolation(
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
}

