public enum ChangeStatus: String, Codable {
    case addition = "A"
    case copy = "C"
    case deletion = "D"
    case modification = "M"
    case renaming = "R"
    case typeChange = "T"
    case unmerged = "U"
    case unknown = "X"
}
