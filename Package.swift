// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ArctKit",
    platforms: [.iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ArctKit",
            targets: ["ArctKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/k-arindam/MLXKit.git", from: "0.0.1"),
        .package(url: "https://github.com/marmelroy/PhoneNumberKit.git", from: "4.0.1")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ArctKit",
            dependencies: ["MLXKit", "PhoneNumberKit"]
        ),
        .testTarget(
            name: "ArctKitTests",
            dependencies: ["ArctKit"]
        ),
    ]
)
