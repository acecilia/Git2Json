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
