import Foundation
import Git2JsonCore

let diff = try Git.diff(.against(target: "origin/master")).run()
let gitAbsoluteTopLevel = Git.absoluteTopLevel.run()

for (index, change) in diff.enumerated() {
    XcodeReporter.print(.warning, file: "\(gitAbsoluteTopLevel)/\(change.path)", "index \(index), status: \(change.status)")
}
XcodeReporter.print(.warning, file: "/Users/andres/Git/Git2Json/Sources/Git2JsonCore/Sources/Git/Git.swift", "Changes count: \(diff.count)")

// Changelog check
let changelogFileName = "CHANGELOG.md"
if !diff.modifiedFiles.contains{ $0 == changelogFileName } {
    // XcodeReporter.print(.error, file: "\(gitAbsoluteTopLevel)/\(changelogFileName)", "Changes are made, but no changelog entry has been found")
}

XcodeReporter.finish()
