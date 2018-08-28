import Foundation

extension UnitTestsDataSource {
    enum Valid: String, TxtFileContentRepresentable {
        case commit
        case commitListWithOneCommit
        case commitListWithThreeCommits

        case changelog
        case changelogWithNumstatBeforeRaw
        case changelogWithRawMixedWithNumstat

        /// to be removed with Swift 4.2
        static let allCases: [UnitTestsDataSource.Valid] = [
            commit,
            commitListWithOneCommit,
            commitListWithThreeCommits,

            changelog,
            changelogWithNumstatBeforeRaw,
            changelogWithRawMixedWithNumstat
        ]

        static var directory: URL {
            var directory = URL(fileURLWithPath: #file)
            directory.deleteLastPathComponent()
            return directory
        }
    }
}
