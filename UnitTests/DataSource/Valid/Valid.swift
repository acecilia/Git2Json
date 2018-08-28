import Foundation

extension UnitTestsDataSource {
    enum Valid: String, TxtFileContentRepresentable {
        case commit
        case commitListWithOneCommit
        case commitListWithThreeCommits

        case changelog
        case changelogWithNumstatBeforeRaw
        case changelogWithRawMixedWithNumstat

        var referencePath: String { return #file }

        func updateFileContent() {
            /*switch self {

            case .changelog: <#code#>
            case .changelogWithNumstatBeforeRaw: <#code#>
            case .changelogWithRawMixedWithNumstat: <#code#>

            case .commit: <#code#>
            case .commitListWithOneCommit: <#code#>
            case .commitListWithThreeCommits: <#code#>
            }*/
        }
    }
}
