import Foundation
import Git2JsonCore

let diffCmd = Git.diff(.against(target: "origin/master"))
let diff = try diffCmd.run()

let gitAbsoluteTopLevel = Git.absoluteTopLevel.rawOutput()

for (index, change) in diff.enumerated() {
    print("\(gitAbsoluteTopLevel)/\(change.path):7:: warning: index \(index), status: \(change.status)")
}
print("/Users/andres/Git/Git2Json/Sources/Git2JsonCore/Sources/Git/Git.swift:7:: warning: changes count: \(diff.count)")
exit(0)

