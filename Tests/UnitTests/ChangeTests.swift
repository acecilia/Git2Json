import XCTest
@testable import Git2JsonCore

class ChangeTests: XCTestCase {

    func testValidMultipleChanges() throws {
        var changes: [Change] = []

        changes = try Change.decodeMultiple(from: UnitTestsDataSource.Valid.changelog.fileContent)
        XCTAssertEqual(3, changes.count)

        changes = try Change.decodeMultiple(from: UnitTestsDataSource.Valid.changelogWithNumstatBeforeRaw.fileContent)
        XCTAssertEqual(3, changes.count)

        changes = try Change.decodeMultiple(from: UnitTestsDataSource.Valid.changelogWithRawMixedWithNumstat.fileContent)
        XCTAssertEqual(3, changes.count)
    }
}
