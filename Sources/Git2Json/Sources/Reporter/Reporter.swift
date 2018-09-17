import Foundation

public var violations: [Violation] {
    get { return Reporter.shared.violations }
    set {Reporter.shared.violations = newValue }
}

public func print(
    _ severity: Severity,
    file: String? = nil,
    line: Int? = nil,
    character: Int? = nil,
    _ message: String
    ) {
    Reporter.shared.print(severity, file: file, line: line, character: character, message)
}

public func exit(failOnError: Bool = true) {
    Reporter.shared.exit(failOnError: failOnError)
}

private struct Reporter {
    var violations: [Violation] = []

    mutating func print(
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

    func exit(failOnError: Bool = true) {
        if failOnError && violations.contains{ $0.severity == .error } {
            Foundation.exit(1)
        }
        Foundation.exit(0)
    }
}

extension Reporter {
    static var shared = Reporter()
}
