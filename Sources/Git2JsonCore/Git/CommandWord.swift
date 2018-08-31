enum CmdComponent: CustomStringConvertible {
    case git
    case noPager
    case log
    case raw
    case numstat
    case pretty(format: String)
    case revision(String)
    case commitCount(Int)
    case revisionRange(older: String, newer: String)
    case custom(String)

    var description: String {
        switch self {
        case .git: return "git"
        case .noPager: return "--no-pager"
        case .log: return "log"
        case .raw: return "--raw"
        case .numstat: return "--numstat"
        case let .pretty(format): return "--pretty='\(format)'"
        case let .revision(revision): return "\(revision)"
        case let .commitCount(count): return "-\(count)"
        case let .revisionRange(olderRevision, newerRevision): return "\(olderRevision)..\(newerRevision)"
        case let .custom(custom): return "\(custom)"
        }
    }
}
