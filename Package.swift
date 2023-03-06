// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MacDirtyCow.swift",
	platforms: [
		.iOS(.v14),
		.tvOS(.v14)
	],
    products: [
        .library(
            name: "MacDirtyCow.swift",
            targets: ["MacDirtyCow.swift"]),
        .library(
            name: "MacDirtyCow.swift-Static",
            type: .static,
            targets: ["MacDirtyCow.swift"]),
        .library(
            name: "MacDirtyCow.swift-Dynamic",
            type: .dynamic,
            targets: ["MacDirtyCow.swift"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "MacDirtyCow",
            dependencies: []),

        .target(
            name: "MacDirtyCow.swift",
            dependencies: ["MacDirtyCow"]),
        .testTarget(
            name: "MacDirtyCow.swiftTests",
            dependencies: ["MacDirtyCow.swift"]),
    ],
	swiftLanguageVersions: [.v5],
    cLanguageStandard: .c11,
    cxxLanguageStandard: .cxx11
)
