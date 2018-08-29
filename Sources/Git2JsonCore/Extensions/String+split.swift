import Foundation

extension String {
    func filteredComponents<T>(separatedBy separator: T) -> [String] where T : StringProtocol {
        return self.components(separatedBy: separator).cleanAndFilter()
    }

    func filteredComponents(separatedBy separators: CharacterSet) -> [String] {
        return self.components(separatedBy: separators).cleanAndFilter()
    }
}

private extension Array where Element == String {
    func cleanAndFilter() -> [String] {
        return self.map{ $0.trimmingCharacters(in: .whitespacesAndNewlines) }.filter { !$0.isEmpty }
    }
}

