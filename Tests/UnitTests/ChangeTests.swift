import XCTest
@testable import Git2JsonCore

class ChangeTests: XCTestCase {

    func testValidMultipleChanges() throws {
        var changes: [Change] = []

        changes = try Change.decodeMultiple(from: UnitTestsDataSource.Valid.changelog.fileContent)
        XCTAssertEqual(5, changes.count)

        changes = try Change.decodeMultiple(from: UnitTestsDataSource.Valid.changelogWithRandomOrderedLines.fileContent)
        XCTAssertEqual(5, changes.count)
    }
}
