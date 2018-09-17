import Foundation
import Git2Json // marathon:https://github.com/acecilia/Git2Json.git

// xcrun --sdk macosx swift run --package-path Danger -Xswiftc "-target" -Xswiftc "x86_64-apple-macosx10.13"
// swift run --package-path Danger -Xswiftc "-target" -Xswiftc "x86_64-apple-macosx10.13"
let reporter = XcodeReporter()
let diff = try Git.diff(.against(target: "origin/master")).run()

for (index, change) in diff.enumerated() {
    reporter.warning(file: "\(change.path)", "index \(index), status: \(change.status)")
}
reporter.warning("Changes count: \(diff.count)")

// Changelog check
let changelogFilePath = "CHANGELOG.md"
if !diff.modifiedFiles.contains { $0.contains(changelogFilePath) } {
    reporter.error(file: changelogFilePath, "Changes are made, but no new changelog entry has been found")
}

reporter.finish()
