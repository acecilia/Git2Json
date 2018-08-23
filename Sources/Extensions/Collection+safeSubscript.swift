import Foundation

extension Collection {

    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    ///
    /// - Parameter index: the index to access
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
