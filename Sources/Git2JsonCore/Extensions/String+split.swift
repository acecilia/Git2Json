import Foundation

extension String {
    func filteredComponents<T>(separatedBy separator: T) -> [String] where T : StringProtocol {
        return self.components(separatedBy: separator).cleanComponents()
    }

    func filteredComponents(separatedBy separators: CharacterSet) -> [String] {
        return self.components(separatedBy: separators).cleanComponents()
    }
}

private extension Array where Element == String {
    func cleanComponents() -> [String] {
        return self.map{ $0.trimmingCharacters(in: .whitespacesAndNewlines) }.filter { !$0.isEmpty }
    }
}

