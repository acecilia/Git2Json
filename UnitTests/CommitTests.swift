import XCTest
@testable import Git2Json

class CommitTests: XCTestCase {
    func testValidCommit() throws {
        let commit = try Commit(from: UnitTestsDataSource.ValidCommitLogs.defaultOutput)
        XCTAssertEqual("Andrés Cecilia Luque", commit.metadata.authorName)
        XCTAssertEqual("e855cc48203651a47c455ef4a623c360020458c6", commit.metadata.hash)
        XCTAssertEqual("Initial Commit", commit.metadata.subject)
        XCTAssertEqual(3, commit.changes.count)
    }

    func testValidMultipleCommits() throws {
        var commits: [Commit] = []

        commits = try Commit.decodeMultiple(from: UnitTestsDataSource.ValidMultipleCommitLogs.oneCommit)
        XCTAssertEqual(1, commits.count)

        commits = try Commit.decodeMultiple(from: UnitTestsDataSource.ValidMultipleCommitLogs.threeCommits)
        XCTAssertEqual(3, commits.count)
    }
}
