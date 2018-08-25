import Foundation

struct CommitMetadata: Codable {
    let authorName: String
    let hash: String
    let subject: String

    static var gitPrettyFormat: String {
        let object = CommitMetadata(
            authorName: "%an",
            hash: "%H",
            subject: "%s"
        )

        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        guard let json = try? encoder.encode(object), let jsonString = String(data: json, encoding: .utf8) else {
            fatalError("The commit metadata git-pretty-format string could not be generated")
        }
        return jsonString.replacingOccurrences(of: "\n", with: "%n")
    }
}
