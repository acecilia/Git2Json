import Foundation

extension UnitTestsDataSource {
    enum Valid: String, TxtFileContentRepresentable {
        case commit
        case commitListWithOneCommit
        case commitListWithThreeCommits

        case changelog
        case changelogWithNumstatBeforeRaw
        case changelogWithRawMixedWithNumstat

        var path: String { return #file }
    }
}
