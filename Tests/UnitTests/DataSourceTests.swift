import XCTest
import SwiftShell
@testable import Git2JsonCore

class DataSourceTests: XCTestCase {
    private let updateDataSource = false

    func testValidateDataSource() {
        var context = CustomContext(main)
        context.currentdirectory = UnitTestsDataSource.Valid.directory.path

        for element in UnitTestsDataSource.Valid.allCases {
            let command: String

            switch element {
            case .commit:
                command = [
                    Git(from: "fe749215d7d9a038e18ecde588d3c859374caa99", commits: 1).command,
                    "|",
                    "sed '1d'"
                ].joined(separator: " ")
            case .commitListWithOneCommit:
                command = Git(from: "fe749215d7d9a038e18ecde588d3c859374caa99", commits: 1).command
            case .commitListWithThreeCommits:
                command = Git(from: "fe749215d7d9a038e18ecde588d3c859374caa99", commits: 3).command

            case .changelog, .changelogWithNumstatBeforeRaw, .changelogWithRawMixedWithNumstat:
                command = ""
            }

            guard !command.isEmpty else {
                continue
            }

            let output = context.run(bash: command).stdout
            if updateDataSource {
                try! output.write(to: element.txtFilePath, atomically: false, encoding: .utf8)
            }

            XCTAssertEqual(output, element.fileContent)
        }
    }
}
