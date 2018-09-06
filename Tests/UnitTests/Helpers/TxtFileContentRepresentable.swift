import Foundation

protocol TxtFileContentRepresentable {
    static var directory: URL { get }
    var txtFilePath: URL { get }
    var fileContent: String { get }
}

extension TxtFileContentRepresentable {
    var fileContent: String { return try! String(contentsOf: txtFilePath) }
}
