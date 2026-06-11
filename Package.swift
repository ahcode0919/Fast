// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "Fast",
    platforms: [.macOS(.v10_13), .iOS(.v13)],
    products: [
        .library(
            name: "Fast",
            targets: ["Fast"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Fast",
            dependencies: []),
        .testTarget(
            name: "FastTests",
            dependencies: ["Fast"]),
    ]
)
