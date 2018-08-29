import Foundation

struct Commit: Codable {
    let authorName: String
    let hash: String
    let subject: String

    let changes: [Change]
}

extension Commit {
    static var gitPrettyFormat: String {
        return "\(separator)%n\(CommitMetadata.gitPrettyFormat)%n\(sectionsSeparator)%n"
    }
}

extension Commit {
    private static let separator = "---"
    private static let sectionsSeparator = "###"

    private enum CodingIndices: Int {
        case hash, author, subject
    }

    /// Decode a Commit object from a string, which is the output of the git command.
    ///
    /// - Parameters:
    ///   - string: The command output.
    ///   - sectionsSeparator: The string used as a separator for delimiting the commit information sections.
    /// - Throws: A decoding error.
    init(from string: String, sectionsSeparator: String = Commit.sectionsSeparator) throws {
        let commitSections = string.filteredComponents(separatedBy: sectionsSeparator)
        guard commitSections.count == 2 else {
            let context = DecodingError.Context(codingPath: [], debugDescription: "The commit string must be splitted in two by the separator string \"\(Commit.separator)\": the commit information and the commit changes. Failing string: \(string)")
            throw DecodingError.dataCorrupted(context)
        }
        let commitMetadata = commitSections[0]
        let data = Data(commitMetadata.utf8)
        let metadata = try JSONDecoder().decode(CommitMetadata.self, from: data)
        authorName = metadata.authorName
        hash = metadata.hash
        subject = metadata.subject

        let commitChanges = commitSections[1]
        changes = try Change.decodeMultiple(from: commitChanges)
    }
}

extension Commit {
    static func decodeMultiple(from string: String, separator: String = Commit.separator) throws -> [Commit] {
        let commits = string.filteredComponents(separatedBy: separator)
        return try commits.map { try Commit(from: $0) }
    }
}
