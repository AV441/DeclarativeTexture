// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DeclarativeTexture",
    platforms: [
      .iOS(.v13),
    ],
    products: [
        .library(
            name: "DeclarativeTexture",
            targets: ["DeclarativeTexture"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ayham-achami/CTexture", branch: "feature/V-1.1.0")
    ],
    targets: [
        .target(
            name: "DeclarativeTexture",
            dependencies: [
                .product(name: "AsyncDisplayKit", package: "CTexture")
            ],
            path: "Sources"),
        .testTarget(
            name: "DeclarativeTextureTests",
            dependencies: ["DeclarativeTexture"]),
    ]
)
