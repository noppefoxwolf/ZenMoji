// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Zenmoji",
    platforms: [.iOS(.v18)],
    products: [
        .library(
            name: "Zenmoji",
            targets: ["Zenmoji"]),
    ],
    targets: [
        .target(
            name: "Zenmoji"),
        .testTarget(
            name: "ZenmojiTests",
            dependencies: ["Zenmoji"]
        ),
    ]
)
