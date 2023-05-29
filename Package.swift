// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "markdown-module",
    platforms: [
       .macOS(.v12)
    ],
    products: [
        .library(name: "MarkdownModule", targets: ["MarkdownModule"]),
    ],
    dependencies: [
        .package(url: "https://github.com/feathercms/feather-core", .branch("dev")),
        .package(url: "https://github.com/JohnSundell/Ink", from: "0.5.0"),
    ],
    targets: [
        .target(name: "MarkdownModule", dependencies: [
            .product(name: "FeatherCore", package: "feather-core"),
            .product(name: "Ink", package: "Ink"),
        ],
        resources: [
//            .copy("Bundle"),
        ]),
    ]
)
