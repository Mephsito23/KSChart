# KSChart Swift Package Manager 设置说明

## 🎯 单一代码库设计

KSChart 采用**单一代码库**设计，无需维护两套代码：

```
KSChart/
├── Package.swift              # SPM 配置文件
├── KSChart.podspec            # CocoaPods 配置文件
├── KSChart/                   # 源代码目录（SPM和CocoaPods共享）
│   ├── Chart/                 # 核心图表组件
│   ├── CustomModel/           # 自定义数据模型
│   └── Extensions/            # 扩展模块
├── ZeroShare/                 # 示例项目（SPM中排除）
└── Resources/                 # 资源文件（SPM中排除）
```

## 📋 Package.swift 配置详解

```swift
// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "KSChart",
    platforms: [.iOS(.v10)],           // 最低支持 iOS 10.0
    products: [
        .library(name: "KSChart", targets: ["KSChart"])
    ],
    dependencies: [],                   // 无外部依赖
    targets: [
        .target(
            name: "KSChart",
            dependencies: [],
            path: "KSChart",            // 指向现有KSChart目录
            exclude: [                  // 排除不需要的目录
                "ZeroShare",           // 示例项目
                "Resources"            # 资源文件
            ],
            sources: [                 // 只包含源代码目录
                "Chart",
                "CustomModel",
                "Extensions"
            ]
        )
    ]
)
```

## ✅ 优势

1. **无代码重复** - SPM和CocoaPods使用同一套源代码
2. **简单维护** - 只需维护一份代码
3. **向后兼容** - 不影响现有CocoaPods用户
4. **现代体验** - 新用户可享受SPM的便利

## 🔧 使用方法

### 方式1：Xcode添加依赖
```
File → Swift Packages → Add Package Dependency
URL: https://github.com/saeipi/KSChart
```

### 方式2：Package.swift
```swift
dependencies: [
    .package(url: "https://github.com/saeipi/KSChart", from: "5.1.10")
]
```

## ⚠️ 注意事项

- Package.swift 中的 `exclude` 参数确保 ZeroShare 和 Resources 目录不会被包含在SPM包中
- KSChart目录同时被KSChart.podspec和Package.swift引用，实现代码共享
- 无需创建额外的Sources目录或复制文件

## 🎉 总结

这种设计让您能够在保持现有项目结构的同时，为用户提供现代化的SPM集成体验，而且**完全不需要维护两套代码**！