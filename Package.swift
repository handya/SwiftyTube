// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftyTube",
    products: [
        .library(
            name: "SwiftyTube",
            targets: ["SwiftyTube"]),
    ],
    targets: [
        .target(
            name: "SwiftyTube",
            dependencies: []),
        .testTarget(
            name: "SwiftyTubeTests",
            dependencies: ["SwiftyTube"]),
    ]
)
