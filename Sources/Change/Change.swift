import Foundation

struct Change: Codable {
    let path: String
    let changeStatus: ChangeStatus
}

extension Change {

    /// Parse a group of raw or numstat lines (as coming from executing <git log --raw --numstat>)
    /// Example:
    /// :100755 100755 328b5ad... 6e4d50f... M  Sources/UIStackView+initializers.swift
    /// 4       4       Sources/UIStackView+initializers.swift
    ///
    /// - Parameters:
    ///   - string: The string with the raw and numstat lines.
    ///   - allowMalformedElement: If intermediate decoding errors are allowed.
    /// - Returns: An array of successfully decoded changes.
    /// - Throws: A decoding error.
    static func decodeMultiple(from string: String, allowMalformedElement: Bool = false) throws -> [Change] {
        let changeStrings = string.filteredComponents(separatedBy: "\n")

        let rawLines = changeStrings.compactMap { try? RawLine($0) }
        let numstatLines = changeStrings.compactMap { try? NumstatLine($0) }

        let changes: [Change] = rawLines.compactMap { rawLine in
            if let numstatLine = numstatLines.first(where: { $0.path == rawLine.path }) {
                let changeStatus = ChangeStatus(status: rawLine.status, additions: numstatLine.additions, deletions: numstatLine.deletions)
                return Change(path: rawLine.path, changeStatus: changeStatus)
            }
            return nil
        }

        if !allowMalformedElement, changeStrings.count != changes.count * 2 {
            let context = DecodingError.Context(codingPath: [], debugDescription: "The string could not be fully decoded because some of its content is malformed. String: \"\(string)\".")
            throw DecodingError.dataCorrupted(context)
        }

        return changes
    }
}
