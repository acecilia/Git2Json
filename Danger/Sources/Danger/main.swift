import Foundation
import Git2JsonCore

let diff = Git.diff(.against(target: "origin/master"))
print(try diff.run().count)
print("/Users/andres/Git/Git2Json/Sources/Git2JsonCore/Sources/Git:1:: error: uu")
exit(1)

