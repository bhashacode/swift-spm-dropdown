// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "DropDown",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "DropDown",
            targets: ["DropDown"]
        )
    ],
    targets: [
        .target(
            name: "DropDown",
            path: "DropDown",
            exclude: ["Info.plist", "DropDown.h"],
            sources: ["src", "helpers"],
            resources: [
                .process("resources")
            ]
        )
    ],
    swiftLanguageVersions: [.v5]
)
