import XCTest
@testable import Git2Json

class ChangeTests: XCTestCase {

    func testValidMultipleChanges() throws {
        var changes: [Change] = []

        changes = try Change.decodeMultiple(
            from: UnitTestsDataSource.Valid.changelog.fileContent,
            gitTopLevel: UnitTestsDataSource.Valid.topLevel.fileContent
        )
        XCTAssertEqual(5, changes.count)

        changes = try Change.decodeMultiple(
            from: UnitTestsDataSource.Valid.changelogWithRandomOrderedLines.fileContent,
            gitTopLevel: UnitTestsDataSource.Valid.topLevel.fileContent
        )
        XCTAssertEqual(5, changes.count)
    }
}
