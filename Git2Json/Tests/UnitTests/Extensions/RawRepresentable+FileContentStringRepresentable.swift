import Foundation

extension TxtFileContentRepresentable where Self: RawRepresentable, Self.RawValue == String {
    var txtFilePath: URL {
        var txtFilePath = Self.directory
        txtFilePath.appendPathComponent(rawValue)
        txtFilePath.appendPathExtension("txt")
        return txtFilePath
    }
}
