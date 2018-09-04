enum CmdComponent: CustomStringConvertible {
    case git
    case noPager
    case log
    case diff
    case raw
    case numstat
    case pretty(format: String)

    var description: String {
        switch self {
        case .git: return "git"
        case .noPager: return "--no-pager"
        case .log: return "log"
        case .diff: return "diff"
        case .raw: return "--raw"
        case .numstat: return "--numstat"
        case let .pretty(format): return "--pretty='\(format)'"
        }
    }
}

public enum LogCmdComponent: CustomStringConvertible {
    case commitCount(Int)
    case revision(String)
    case against(target: String)
    case range(source: String, target: String)

    public var description: String {
        switch self {
        case let .commitCount(count): return "-\(count)"
        case let .revision(revision): return "\(revision)"
        case let .against(target): return LogCmdComponent.range(source: "HEAD", target: target).description
        case let .range(source, target): return "$(git merge-base \(source) \(target))..\(source)"
        }
    }
}


public enum DiffCmdComponent: CustomStringConvertible {
    case against(target: String)
    case range(source: String, target: String)

    public var description: String {
        switch self {
        case let .against(target): return DiffCmdComponent.range(source: "HEAD", target: target).description
        case let .range(source, target): return "$(git merge-base \(source) \(target)) \(source)"
        }
    }

}
