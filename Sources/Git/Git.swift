import Foundation

struct Git { }

extension Git {
    static var command: String {
        return "git log --raw --numstat --pretty='\(Commit.gitPrettyFormat)'"
    }
}
