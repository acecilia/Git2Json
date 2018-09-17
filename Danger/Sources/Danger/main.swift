import Foundation
import Git2Json // marathon:https://github.com/acecilia/Git2Json.git

// xcrun --sdk macosx swift run --package-path Danger -Xswiftc "-target" -Xswiftc "x86_64-apple-macosx10.13"
// swift run --package-path Danger -Xswiftc "-target" -Xswiftc "x86_64-apple-macosx10.13"

let diff = try Git.diff(.against(target: "origin/master")).run()

for (index, change) in diff.enumerated() {
    reporter.print(.warning, file: "\(change.path)", "index \(index), status: \(change.status)")
}
reporter.print(.warning, "Changes count: \(diff.count)")

// {full_path_to_file}{:line}{:character}: {error,warning}: {content}
print("/Users/andres/Git/Git2Json/Sources/Git2Json/Sources/Git/Git.swift:6:3: error: uu")


// Changelog check
let changelogFileName = "CHANGELOG.md"
if !diff.modifiedFiles.contains{ $0.contains(changelogFileName) } {
    reporter.print(.error, file: "\(changelogFileName)", "Changes are made, but no changelog entry has been found")
}

reporter.finish()
