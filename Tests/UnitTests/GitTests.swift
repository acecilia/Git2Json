import XCTest
@testable import Git2JsonCore

class GitTests: XCTestCase {

    func testGitCommand() {
        let command = """
        git --no-pager log --raw --numstat --pretty='---%n{%n  "authorName" : "%an",%n  "date" : "%cI",%n  "hash" : "%H",%n  "subject" : "%s"%n}%n###%n'
        """

        XCTAssertEqual(command, Git.log().cmd)
    }
}

