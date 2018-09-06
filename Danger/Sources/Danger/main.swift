import Foundation
import Git2JsonCore

let diff = try Git.diff(.against(target: "origin/master")).run()
let gitAbsoluteTopLevel = Git.absoluteTopLevel.run()

for (index, change) in diff.enumerated() {
    print("\(gitAbsoluteTopLevel)/\(change.path):5:: warning: index \(index), status: \(change.status)")
}
print("/Users/andres/Git/Git2Json/Sources/Git2JsonCore/Sources/Git/Git.swift:7:3: warning: changes count: \(diff.count)")
exit(0)

