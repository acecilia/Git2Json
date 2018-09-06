/*public struct XcodeReporter {
    internal static func generateForSingleViolation(_ violation: StyleViolation) -> String {
        // {full_path_to_file}{:line}{:character}: {error,warning}: {content}
        return [
            "\(violation.location): ",
            "\(violation.severity.rawValue): ",
            "\(violation.ruleDescription.name) Violation: ",
            violation.reason,
            " (\(violation.ruleDescription.identifier))"
            ].joined()
    }
}*/
