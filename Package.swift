// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "KSChart",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(
            name: "KSChart",
            targets: ["KSChart"]
        )
    ],
    dependencies: [
        // KSChart库本身无第三方依赖
    ],
    targets: [
        .target(
            name: "KSChart",
            dependencies: [],
            path: "KSChart",
            exclude: [
                "ZeroShare",
                "Resources"
            ],
            sources: [
                "Chart",
                "CustomModel",
                "Extensions"
            ]
        )
    ]
)