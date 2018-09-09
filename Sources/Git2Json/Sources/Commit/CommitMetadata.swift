import Foundation

struct CommitMetadata: Codable {
    let authorName: String
    let hash: String
    let subject: String
    let date: Date

    init(fromJson string: String) throws {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        self = try decoder.decode(CommitMetadata.self, from: Data(string.utf8))
    }

    static var gitPrettyFormat: String {
        let dict: [CodingKeys : String] = [
            .authorName : "%an",
            .hash : "%H",
            .subject : "%s",
            .date : "%cI"
        ]

        let object = Dictionary(uniqueKeysWithValues: dict.map { ($0.key.stringValue, $0.value) })

        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        guard let json = try? encoder.encode(object), let jsonString = String(data: json, encoding: .utf8) else {
            fatalError("The commit metadata git-pretty-format string could not be generated")
        }
        return jsonString.replacingOccurrences(of: "\n", with: "%n")
    }
}
