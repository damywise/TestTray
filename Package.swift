// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TestTray",
    platforms: [
        .macOS(.v10_13)
    ],
    dependencies: [],
    targets: [
        .executableTarget(
            name: "TestTray",
            dependencies: [],
            linkerSettings: [
                .linkedFramework("AppKit")
            ]
        ),
    ]
)
