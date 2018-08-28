import Foundation

struct Git { }

extension Git {
    static var command: String {
        return "git log \(logOptions)"
    }

    static var logOptions: String {
        return "--raw --numstat --pretty='\(Commit.gitPrettyFormat)'"
    }
}
