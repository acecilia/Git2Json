import XCTest
import SwiftShell
@testable import Git2JsonCore

class DataSourceTests: XCTestCase {
    private let updateDataSource = false

    func testValidateDataSource() {
        var context = CustomContext(main)
        context.currentdirectory = UnitTestsDataSource.Valid.directory.path

        for element in UnitTestsDataSource.Valid.allCases {
            let command: [String]

            switch element {
            case .commit:
                command = ["git --no-pager log", Git.logOptions, "fe749215d7d9a038e18ecde588d3c859374caa99", "-1", "|", "sed '1d'"]
            case .commitListWithOneCommit:
                command = ["git --no-pager log", Git.logOptions, "fe749215d7d9a038e18ecde588d3c859374caa99", "-1"]
            case .commitListWithThreeCommits:
                command = ["git --no-pager log", Git.logOptions, "fe749215d7d9a038e18ecde588d3c859374caa99", "-3"]

            case .changelog, .changelogWithNumstatBeforeRaw, .changelogWithRawMixedWithNumstat:
                command = []
            }

            guard !command.isEmpty else {
                continue
            }

            let output = context.run(bash: command.joined(separator: " ")).stdout
            if updateDataSource {
                try! output.write(to: element.txtFilePath, atomically: false, encoding: .utf8)
            }

            XCTAssertEqual(output, element.fileContent)
        }
    }
}
