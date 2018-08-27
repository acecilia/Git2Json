import Foundation

extension TxtFileContentRepresentable where Self: RawRepresentable, Self.RawValue == String {
    var fileContent: String {
        var path = URL(fileURLWithPath: self.path)
        path.deleteLastPathComponent()
        path.appendPathComponent(rawValue)
        path.appendPathExtension("txt")
        return try! String(contentsOf: path)
    }
}
