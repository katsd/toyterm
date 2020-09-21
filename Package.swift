// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "ToyTerm",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "ToyTerm",
            targets: ["ToyTerm"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "ToyTerm",
            dependencies: []),
        .testTarget(
            name: "ToyTermTests",
            dependencies: ["ToyTerm"]),
    ]
)
