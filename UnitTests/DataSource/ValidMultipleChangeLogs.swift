extension UnitTestsDataSource {
    enum ValidMultipleChangeLogs {
        static let defaultOutput = """
        :000000 100644 0000000... 5781ef0... A  Git2Json.xcodeproj/project.pbxproj
        :000000 100644 0000000... b5ca7e9... A  Git2Json.xcodeproj/project.xcworkspace/contents.xcworkspacedata
        :000000 100644 0000000... 18d9810... A  Git2Json.xcodeproj/project.xcworkspace/xcshareddata/IDEWorkspaceChecks.plist
        67      0       Git2Json.xcodeproj/project.pbxproj
        7       0       Git2Json.xcodeproj/project.xcworkspace/contents.xcworkspacedata
        8       0       Git2Json.xcodeproj/project.xcworkspace/xcshareddata/IDEWorkspaceChecks.plist
        """
        
        static let numstatBeforeRaw = """
        67      0       Git2Json.xcodeproj/project.pbxproj
        7       0       Git2Json.xcodeproj/project.xcworkspace/contents.xcworkspacedata
        8       0       Git2Json.xcodeproj/project.xcworkspace/xcshareddata/IDEWorkspaceChecks.plist
        :000000 100644 0000000... 5781ef0... A  Git2Json.xcodeproj/project.pbxproj
        :000000 100644 0000000... b5ca7e9... A  Git2Json.xcodeproj/project.xcworkspace/contents.xcworkspacedata
        :000000 100644 0000000... 18d9810... A  Git2Json.xcodeproj/project.xcworkspace/xcshareddata/IDEWorkspaceChecks.plist
        """

        static let rawMixedWithNumstat = """
        :000000 100644 0000000... 5781ef0... A  Git2Json.xcodeproj/project.pbxproj
        67      0       Git2Json.xcodeproj/project.pbxproj
        :000000 100644 0000000... b5ca7e9... A  Git2Json.xcodeproj/project.xcworkspace/contents.xcworkspacedata
        7       0       Git2Json.xcodeproj/project.xcworkspace/contents.xcworkspacedata
        :000000 100644 0000000... 18d9810... A  Git2Json.xcodeproj/project.xcworkspace/xcshareddata/IDEWorkspaceChecks.plist
        8       0       Git2Json.xcodeproj/project.xcworkspace/xcshareddata/IDEWorkspaceChecks.plist
        """
    }
}
