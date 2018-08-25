import XCTest
@testable import Git2Json

class GitTests: XCTestCase {

    func testGitCommand() {
        let command = """
        git log --raw --numstat --pretty='---%n{%n  "authorName" : "%an",%n  "hash" : "%H",%n  "subject" : "%s"%n}%n###%n'
        """
        XCTAssertEqual(command, Git.command)
    }
}

