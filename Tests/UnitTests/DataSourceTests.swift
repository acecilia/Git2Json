import XCTest
import SwiftShell
@testable import Git2JsonCore

class DataSourceTests: XCTestCase {
    func testValidDataSource() {
        var context = CustomContext(main)
        context.currentdirectory = UnitTestsDataSource.Valid.directory.path

        for element in UnitTestsDataSource.Valid.allCases {
            switch element {
            case .commitListWithOneCommit:
                let commands = ["git --no-pager log", Git.logOptions, "4f27163903eab8aec0b8c77b06e9573253bb60db", "-1"]
                let command = commands.joined(separator: " ")
                let output = context.run(bash: command).stdout
                try! output.write(to: element.txtFilePath, atomically: false, encoding: .utf8)
            default: break
                /*
                 case .changelog: <#code#>
                 case .changelogWithNumstatBeforeRaw: <#code#>
                 case .changelogWithRawMixedWithNumstat: <#code#>

                 case .commit: <#code#>
                 case .commitListWithOneCommit: <#code#>
                 case .commitListWithThreeCommits: <#code#>
                 */
            }
        }

    }
}
