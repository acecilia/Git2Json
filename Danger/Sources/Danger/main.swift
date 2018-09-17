import Foundation
import Git2Json // marathon:https://github.com/acecilia/Git2Json.git

// xcrun --sdk macosx swift run -C Danger -Xswiftc "-target" -Xswiftc "x86_64-apple-macosx10.13"
// swift run -C Danger -Xswiftc "-target" -Xswiftc "x86_64-apple-macosx10.13"

let diff = try Git.diff(.against(target: "origin/master")).run()
let gitAbsoluteTopLevel = Git.absoluteTopLevel.run()

for (index, change) in diff.enumerated() {
    Reporter.print(.warning, file: "\(gitAbsoluteTopLevel)/\(change.path)", "index \(index), status: \(change.status)")
}
Reporter.print(.warning, file: "/Users/andres/Git/Git2Json/Sources/Git2JsonCore/Sources/Git/Git.swift", "Changes count: \(diff.count)")

// Changelog check
let changelogFileName = "CHANGELOG.md"
if !diff.modifiedFiles.contains{ $0 == changelogFileName } {
    Reporter.print(.error, file: "\(gitAbsoluteTopLevel)/\(changelogFileName)", "Changes are made, but no changelog entry has been found")
}

Reporter.exit()
