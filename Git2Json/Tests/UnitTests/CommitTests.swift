import XCTest
@testable import Git2JsonCore

class CommitTests: XCTestCase {
    
    func testValidCommit() throws {
        let commit = try Commit(from: UnitTestsDataSource.Valid.commit.fileContent)
        XCTAssertEqual("Andrés Cecilia Luque", commit.authorName)
        XCTAssertEqual("fe749215d7d9a038e18ecde588d3c859374caa99", commit.hash)
        XCTAssertEqual("Added git command generator", commit.subject)
        XCTAssertEqual(5, commit.changes.count)
    }

    func testValidMultipleCommits() throws {
        var commits: [Commit] = []

        commits = try Commit.decodeMultiple(from: UnitTestsDataSource.Valid.commitListWithOneCommit.fileContent)
        XCTAssertEqual(1, commits.count)

        commits = try Commit.decodeMultiple(from: UnitTestsDataSource.Valid.commitListWithThreeCommits.fileContent)
        XCTAssertEqual(3, commits.count)
    }
}
