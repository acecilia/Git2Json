import Foundation

protocol TxtFileContentRepresentable {
    var path: String { get }
    var fileContent: String { get }
}
