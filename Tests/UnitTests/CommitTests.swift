import XCTest
@testable import Git2JsonCore

class CommitTests: XCTestCase {
    
    func testValidCommit() throws {
        let commit = try Commit(from: UnitTestsDataSource.Valid.commit.fileContent)
        XCTAssertEqual("Andrés Cecilia Luque", commit.metadata.authorName)
        XCTAssertEqual("e855cc48203651a47c455ef4a623c360020458c6", commit.metadata.hash)
        XCTAssertEqual("Initial Commit", commit.metadata.subject)
        XCTAssertEqual(3, commit.changes.count)
    }

    func testValidMultipleCommits() throws {
        var commits: [Commit] = []

        commits = try Commit.decodeMultiple(from: UnitTestsDataSource.Valid.commitListWithOneCommit.fileContent)
        XCTAssertEqual(1, commits.count)

        commits = try Commit.decodeMultiple(from: UnitTestsDataSource.Valid.commitListWithThreeCommits.fileContent)
        XCTAssertEqual(3, commits.count)
    }
}
