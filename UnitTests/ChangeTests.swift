import XCTest
@testable import Git2Json

class ChangeTests: XCTestCase {

    func testValidMultipleChanges() throws {
        var changes: [Change] = []

        changes = try Change.decodeMultiple(from: UnitTestsDataSource.ValidMultipleChangeLogs.defaultOutput)
        XCTAssertEqual(3, changes.count)

        changes = try Change.decodeMultiple(from: UnitTestsDataSource.ValidMultipleChangeLogs.numstatBeforeRaw)
        XCTAssertEqual(3, changes.count)

        changes = try Change.decodeMultiple(from: UnitTestsDataSource.ValidMultipleChangeLogs.rawMixedWithNumstat)
        XCTAssertEqual(3, changes.count)
    }
}
