import XCTest
@testable import Git2Json

class CommitTests: XCTestCase {
    
    func testValidCommit() throws {
        let commit = try Commit(
            from: UnitTestsDataSource.Valid.commit.fileContent,
            gitTopLevel: UnitTestsDataSource.Valid.topLevel.fileContent
        )
        XCTAssertEqual("Andrés Cecilia Luque", commit.authorName)
        XCTAssertEqual("fe749215d7d9a038e18ecde588d3c859374caa99", commit.hash)
        XCTAssertEqual("Added git command generator", commit.subject)
        XCTAssertEqual(5, commit.changes.count)
        XCTAssertEqual("/Users/andres/Git/Git2Json/Git2Json.xcodeproj/project.pbxproj", commit.changes.first?.path)
    }

    func testValidMultipleCommits() throws {
        var commits: [Commit] = []

        commits = try Commit.decodeMultiple(
            from: UnitTestsDataSource.Valid.commitListWithOneCommit.fileContent,
            gitTopLevel: UnitTestsDataSource.Valid.topLevel.fileContent
        )
        XCTAssertEqual(1, commits.count)

        commits = try Commit.decodeMultiple(
            from: UnitTestsDataSource.Valid.commitListWithThreeCommits.fileContent,
            gitTopLevel: UnitTestsDataSource.Valid.topLevel.fileContent
        )
        XCTAssertEqual(3, commits.count)
    }
}
