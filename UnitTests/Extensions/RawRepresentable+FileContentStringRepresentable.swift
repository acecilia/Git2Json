import Foundation

extension TxtFileContentRepresentable where Self: RawRepresentable, Self.RawValue == String {
    var txtFilePath: URL {
        var fileContentPath = URL(fileURLWithPath: referencePath)
        fileContentPath.deleteLastPathComponent()
        fileContentPath.appendPathComponent(rawValue)
        fileContentPath.appendPathExtension("txt")
        return fileContentPath
    }
}
