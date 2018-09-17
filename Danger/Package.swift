// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Danger",
    dependencies: [
        .package(url: /*"https://github.com/acecilia/Git2Json.git"*/ "../", .branch("master")),
    ],
    targets: [
        .target(name: "Danger", dependencies: ["Git2Json"])
    ]
)
