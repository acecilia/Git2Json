import Foundation

struct ChangeStatus: Codable {
    let status: FileStatus
    let additions: Int
    let deletions: Int
}

extension ChangeStatus {
    private enum CodingIndices: Int {
        case status = 4
        case additions = 0
        case deletions = 1
    }
}
