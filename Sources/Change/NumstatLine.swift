import Foundation

struct NumstatLine: Codable {
    let path: String
    let additions: Int
    let deletions: Int

    private enum CodingIndices: Int, CodingKey {
        case additions = 0
        case deletions = 1
        case path = 2
    }

    init(_ string: String) throws {
        let components = string.filteredComponents(separatedBy: " ")
        path = try components.decode(key: CodingKeys.path, at: CodingIndices.path)
        additions = try components.decode(key: CodingKeys.additions, at: CodingIndices.additions, map: { Int($0) })
        deletions = try components.decode(key: CodingKeys.deletions, at: CodingIndices.deletions, map: { Int($0) })
    }
}
