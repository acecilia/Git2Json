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
        let fileString: String = file.map { "\($0)" } ?? ""
        let lineString: String = line.map { "\($0)" } ?? ""
        let charString: String = character.map { "\($0)" } ?? ""
        return [fileString, lineString, charString].joined(separator: ":")
    }
}
