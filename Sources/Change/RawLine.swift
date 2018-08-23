struct RawLine: Codable {
    let path: String
    let status: ChangeStatus

    private enum CodingIndices: Int, CodingKey {
        case status = 4
        case path = 5
    }

    init(_ string: String) throws {
        let components = string.filteredComponents(separatedBy: " ")
        path = try components.decode(key: CodingKeys.path, at: CodingIndices.path)
        status = try components.decode(key: CodingKeys.status, at: CodingIndices.status, map: { ChangeStatus(rawValue: $0) })
    }
}
