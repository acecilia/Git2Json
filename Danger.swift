import Foundation
import Git2JsonCore // marathon:https://github.com/acecilia/Git2Json.git

let diff = Git.diff(.against(target: "origin/master"))
print(try diff.run().additions)
print("/Users/andres/Git/Git2Json/Sources/Git2JsonCore/Sources/Git:1:: error: uu")
exit(1)

