// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Homework1",
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
                .package(url:"https://github.com/IBM-Swift/Kitura.git",from: "2.8.0"),
        .package(url:"https://github.com/IBM-Swift/HeliumLogger.git",from: "1.0.0"),
        .package(url:"https://github.com/stephencelis/SQLite.swift.git", from: "0.11.5"),
        .package(url:"https://github.com/IBM-Swift/Kitura-StencilTemplateEngine.git",from: "1.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "Homework1",
            dependencies: ["Kitura", "HeliumLogger","SQLite"]),
        .testTarget(
            name: "Homework1Tests",
            dependencies: ["Homework1"]),
    ]
)
