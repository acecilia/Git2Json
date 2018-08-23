import Foundation

extension String {
    func filteredComponents<T>(separatedBy separator: T) -> [String] where T : StringProtocol {
        return self.components(separatedBy: separator).filter { !$0.isEmpty }
    }
}

