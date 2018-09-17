// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "Git2Json",
    products: [
        .library(name: "Git2Json", targets: ["Git2Json"])
    ],
    dependencies: [
        .package(url: "https://github.com/kareman/SwiftShell", from: "4.0.0")
    ],
    targets: [
        .target(name: "Git2Json", dependencies: ["SwiftShell"]),
        .testTarget(name: "UnitTests", dependencies: ["Git2Json"])
    ]
)
