import XCTest
@testable import Git2JsonCore

class DataSourceTests: XCTestCase {
    private let updateDataSource = false

    func testValidateDataSource() {
        for element in UnitTestsDataSource.Valid.allCases {
            let generatedFileContent: String

            switch element {
            case .commit:
                var git = Git(from: "fe749215d7d9a038e18ecde588d3c859374caa99", commits: 1)
                git.command += "| sed '1d'" // Remove first line
                generatedFileContent = git.rawOutput()

            case .commitListWithOneCommit:
                generatedFileContent = Git(from: "fe749215d7d9a038e18ecde588d3c859374caa99", commits: 1).rawOutput()

            case .commitListWithThreeCommits:
                generatedFileContent = Git(from: "fe749215d7d9a038e18ecde588d3c859374caa99", commits: 3).rawOutput()

            case .changelog:
                var git = Git()
                git.command = "git --no-pager log --raw --numstat --pretty='' fe749215d7d9a038e18ecde588d3c859374caa99 -1"
                generatedFileContent = git.rawOutput()

            case .changelogWithRandomOrderedLines:
                let log = UnitTestsDataSource.Valid.changelog.fileContent
                let lines = log.filteredComponents(separatedBy: "\n")
                let randomOrderedLines = lines.sorted { $0.hash > $1.hash }
                generatedFileContent = randomOrderedLines.joined(separator: "\n")
            }

            if updateDataSource {
                try! generatedFileContent.write(to: element.txtFilePath, atomically: false, encoding: .utf8)
            }

            XCTAssertEqual(generatedFileContent, element.fileContent)
        }
    }
}
