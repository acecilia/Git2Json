import XCTest
@testable import Git2Json

class DataSourceTests: XCTestCase {
    private let updateDataSource = false

    func testValidateDataSource() throws {
        for element in UnitTestsDataSource.Valid.allCases {
            let generatedFileContent: String

            switch element {
            case .topLevel:
                generatedFileContent = try Git.topLevel.rawOutput()

            case .commit:
                var git = Git.log(.revision("fe749215d7d9a038e18ecde588d3c859374caa99"), .commitCount(1))
                git.cmd += "| sed '1d'" // Remove first line
                generatedFileContent = try git.rawOutput()

            case .commitListWithOneCommit:
                generatedFileContent = try Git.log(.revision("fe749215d7d9a038e18ecde588d3c859374caa99"), .commitCount(1)).rawOutput()

            case .commitListWithThreeCommits:
                generatedFileContent = try Git.log(.revision("fe749215d7d9a038e18ecde588d3c859374caa99"), .commitCount(3)).rawOutput()

            case .changelog:
                generatedFileContent = try Git.diff(
                    .range(
                        source: "fe749215d7d9a038e18ecde588d3c859374caa99",
                        target: "edfea4493b04be500f5d0d566b4c7defeb9cd340"
                    )
                ).rawOutput()

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
