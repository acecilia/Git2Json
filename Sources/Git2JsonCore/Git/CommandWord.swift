enum CmdComponent: CustomStringConvertible {
    case git
    case noPager
    case log
    case raw
    case numstat
    case pretty(format: String)
    case revision(String)

    case logCommitCount(Int)
    case logRevisionRange(source: String, target: String)

    case diffRevisionRange(source: String, target: String)

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

        case let .logCommitCount(count): return "-\(count)"
        case let .logRevisionRange(source, target): return "$(git merge-base \(source) \(target))..\(source)"

        case let .diffRevisionRange(source, target): return "$(git merge-base \(source) \(target)) \(source)"

        case let .custom(custom): return "\(custom)"
        }
    }
}
