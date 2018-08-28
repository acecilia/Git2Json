import Foundation

protocol TxtFileContentRepresentable {
    var referencePath: String { get }
    var txtFilePath: URL { get }
    var fileContent: String { get }
    func updateFileContent()
}

extension TxtFileContentRepresentable {
    var fileContent: String { return try! String(contentsOf: txtFilePath) }
}
