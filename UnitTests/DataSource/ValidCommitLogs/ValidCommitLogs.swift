extension UnitTestsDataSource {
    enum ValidCommitLogs {
        static let defaultOutput = """
{
"hash":"e855cc48203651a47c455ef4a623c360020458c6",
"authorName":"Andrés Cecilia Luque",
"subject":"Initial Commit"
}
###


:000000 100644 0000000... 5781ef0... A  Git2Json.xcodeproj/project.pbxproj
:000000 100644 0000000... b5ca7e9... A  Git2Json.xcodeproj/project.xcworkspace/contents.xcworkspacedata
:000000 100644 0000000... 18d9810... A  Git2Json.xcodeproj/project.xcworkspace/xcshareddata/IDEWorkspaceChecks.plist
67      0       Git2Json.xcodeproj/project.pbxproj
7       0       Git2Json.xcodeproj/project.xcworkspace/contents.xcworkspacedata
8       0       Git2Json.xcodeproj/project.xcworkspace/xcshareddata/IDEWorkspaceChecks.plist
"""
    }
}
