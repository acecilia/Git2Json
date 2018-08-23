import Foundation

struct ChangeStatus: Codable {
    let status: FileStatus
    let additions: Int
    let deletions: Int
}
