# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

# KSChart 项目架构文档

## 项目概述

KSChart 是一个高性能的 iOS K线图库项目，包含两个主要组件：
1. **KSChart** - 核心图表库组件（可独立发布的 CocoaPods 库）
2. **ZeroShare** - 完整的交易所应用示例

项目使用 Swift 5.1+ 开发，采用 iOS 10.0+ 作为最低部署目标，专注于提供高性能、低内存占用的图表解决方案。

## 项目结构

```
KSChart/
├── KSChart/                      # 核心图表库（CocoaPods 模块）
│   ├── Chart/                    # 图表核心组件
│   │   ├── KSLayer.swift         # 图层基类
│   │   ├── KSKLineChartView.swift # K线图主视图
│   │   ├── KSChartConfigure.swift # 图表配置
│   │   ├── KSChartModel.swift     # 图表数据模型
│   │   └── KSCalculator.swift     # 技术指标计算
│   ├── CustomModel/              # 自定义数据模型
│   └── Extensions/               # 扩展模块
│       ├── ChartExtensions/      # 图表扩展
│       └── ShareExtensions/      # 分享扩展
├── ZeroShare/                    # 完整应用示例
│   ├── ZeroShare.xcodeproj       # 主项目文件
│   ├── ZeroShare.xcworkspace     # CocoaPods 工作空间
│   ├── Pods/                     # CocoaPods 依赖
│   └── ZeroShare/                # 应用源代码
│       └── Scripts/               # 源代码目录
│           ├── Classes/          # 主要业务代码
│           │   ├── BaseClass/     # 基础类
│           │   │   ├── Controller/ # 基础控制器
│           │   │   ├── Cell/     # 基础单元格
│           │   │   └── View/     # 基础视图
│           │   ├── Dashboard/    # 仪表盘模块
│           │   │   ├── Main/     # 主界面
│           │   │   │   ├── Controller/ # 主控制器
│           │   │   │   ├── Model/      # 数据模型
│           │   │   │   ├── Request/    # 网络请求
│           │   │   │   └── View/       # 视图组件
│           │   │   └── Childs/   # 子模块
│           │   │       ├── OrderBook/  # 订单簿
│           │   │       └── MarketTrade/ # 市场交易
│           │   └── Main/         # 主页面
│           ├── Main/             # 应用主入口
│           │   ├── AppDelegate/   # 应用代理
│           │   ├── Cell/         # 单元格
│           │   └── Controller/    # 控制器
├── DrafterStage/                 # 前端展示（可能是文档或演示）
│   ├── bundle.js
│   └── index.html
├── Resources/                    # 项目资源
│   ├── *.jpg                    # 项目截图
│   ├── *.jpeg
│   └── *.png
├── KSChart.podspec               # CocoaPods 规格文件
├── README.md                     # 项目说明文档
└── LICENSE                       # 许可证文件
```

## 技术栈

### 核心技术
- **Swift 5.1+** - 主要开发语言
- **iOS 10.0+** - 目标平台
- **CocoaPods** - 依赖管理

### UI 框架
- **UIKit** - 原生 UI 框架
- **CAShapeLayer** - 图形绘制
- **UIBezierPath** - 路径绘制
- **CATextLayer** - 文本绘制

### 第三方依赖
```ruby
# Podfile 中的主要依赖
pod 'HandyJSON', '~> 5.0.0'        # JSON 解析
pod 'SnapKit', '~> 5.0.0'           # Auto Layout
pod 'Alamofire', '~> 5.0.0-beta.5'  # 网络请求
pod 'SwiftyJSON', '~> 5.0.0'       # JSON 处理
pod 'MXSegmentedPager', '~> 3.3.0' # 分页控制器
pod 'SocketRocket', '~> 0.5.1'     # WebSocket
```

## 核心功能

### KSChart 库特性
- ✅ 支持多种图表类型：K线图、分时图、指标图
- ✅ 集成技术指标：MA/EMA/MACD/KDJ/BOLL/RSI/WR/AVG
- ✅ 高性能渲染：CPU/内存占用率极低，60FPS 稳定运行
- ✅ 支持添加自定义指标
- ✅ 适用于股票/区块链交易所等场景

### ZeroShare 应用特性
- ✅ WebSocket 实时数据连接
- ✅ 币安数据集成（需VPN）
- ✅ 订单簿显示
- ✅ 市场交易记录
- ✅ 仪表盘界面

## 开发指南

### 环境设置
1. **Xcode 11.0+** 是必需的
2. **Swift 5.1+** 支持
3. 使用 CocoaPods 管理依赖

### 构建和运行
```bash
# 安装 CocoaPods 依赖
cd ZeroShare
pod install

# 打开项目
open ZeroShare.xcworkspace
```

### 代码组织原则
1. **模块化设计**：图表库与应用分离
2. **MVC 模式**：清晰的 Model-View-Controller 分层
3. **扩展模式**：大量使用 Swift 扩展
4. **基础类继承**：统一的基类体系

### 命名规范
- 所有类都以 `KS` 前缀开头（KSChart 风格）
- 控制器：`XXXController`
- 视图：`XXXView`
- 模型：`XXXModel`
- 单元格：`XXXCell`
- 协议：`XXXDelegate`

### 关键组件说明

#### KSChart 核心组件
- **KSKLineChartView** - K线图主视图，处理渲染和交互
- **KSChartConfigure** - 图表配置管理
- **KSChartModel** - 图表数据模型
- **KSCalculator** - 技术指标计算器

#### ZeroShare 应用组件
- **KSBinanceController** - 币安数据控制器
- **KSSocketMsgMgr** - WebSocket 消息管理
- **KSDashboardConfigure** - 仪表盘配置
- **KSOrderBookController** - 订单簿控制器

## 性能优化

### 渲染优化
- 使用 CAShapeLayer 进行高效图形绘制
- 分层管理绘制内容
- 精简边框与 Y 轴数值绘制
- 60FPS 稳定运行

### 内存优化
- 内存占用极低（500条K线数据仅占用3M）
- 代码精简，减少冗余
- 优化的数据结构

## 数据流

1. **数据源**：通过 WebSocket 连接币安 API
2. **数据模型**：使用 HandyJSON 进行解析
3. **数据处理**：KSCalculator 计算技术指标
4. **渲染输出**：CAShapeLayer + UIBezierPath 绘制
5. **用户交互**：触摸事件处理和视图更新

## 扩展开发

### 添加自定义指标
1. 在 KSCalculator.swift 中添加计算逻辑
2. 在 KSChartConfigure.swift 中配置显示
3. 在相关视图中添加渲染代码

### 集成新的数据源
1. 创建对应的数据控制器
2. 实现 WebSocket 连接
3. 更新数据模型和显示逻辑

## 注意事项

1. **网络依赖**：WebSocket 连接需要稳定的网络环境
2. **数据格式**：确保数据格式与期望的 JSON 结构匹配
3. **性能监控**：关注 CPU 和内存使用情况
4. **版本兼容**：保持与 iOS 10.0+ 的兼容性

## 版本历史

- **5.1.8**：优化CPU和内存占用率，精简代码
- **5.1.9**：新增WR/AVG指标，精简代码
- **5.1.10**：优化时间线逻辑，精简代理方法
- **后续版本**：计划重新添加最大最小值的显示

## 联系信息

- 技术交流群：902071358
- 项目主页：https://github.com/saeipi/KSChart
- 作者：saeipi (ksert@163.com)
