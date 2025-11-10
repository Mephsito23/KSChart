k线图/kline/kchart，已经集成MA/EMA/MACD/KDJ/BOLL/RSI/WR/AVG等指标，新增指标及其方便。适用于股票/区块链交易所等种类App。Swift5编写，CPU/内存占用率极低，60FPS稳定运行。示例集成websocket，并接入币安数据（需VPN）。项目采用CAShapelayer+UIBezierPath进行图形绘制，采用CATextLayer进行文本绘制。

## 项目推荐

Golang + Vue3 加密币模拟交易所。

https://github.com/sevtin/coinex

https://eipistar.dpdns.org/


## KSChart 效果图
<img src="https://github.com/saeipi/KSChart/blob/master/Resources/time.jpg" alt="分时图" width="600" height="604" align="middle"/>

<img src="https://github.com/saeipi/KSChart/blob/master/Resources/tais.jpg" alt="指标菜单" width="600" height="604" align="middle"/>

<img src="https://github.com/saeipi/KSChart/blob/master/Resources/candle.jpg" alt="蜡烛图" width="600" height="604" align="middle"/>

<img src="https://github.com/saeipi/KSChart/blob/master/Resources/cross.jpg" alt="选中单个蜡烛图" width="600" height="604" align="middle"/>

### 500多条K线数据，真机示例内存占用为11.8M（其中KSChart占用3M），机型不同CPU占用差异会比较大，老设备在滑动时帧数会略有下降
<img src="https://github.com/saeipi/KSChart/blob/master/Resources/cpu.jpg" alt="cpu占用率" width="800" height="338.6" align="middle"/>

<img src="https://github.com/saeipi/KSChart/blob/master/Resources/memory.jpg" alt="memory占用率" width="800" height="458" align="middle"/>


## 安装

### Swift Package Manager (推荐)

KSChart 现在支持 Swift Package Manager，使用单一代码库，无需维护两套代码：

**在 Xcode 中：**
1. 选择 `File > Swift Packages > Add Package Dependency...`
2. 输入仓库URL：`https://github.com/Mephsito23/KSChart.git`
3. 选择版本并点击 `Add Package`

**在 Package.swift 中：**
```swift
dependencies: [
    .package(url: "https://github.com/Mephsito23/KSChart.git", from: "5.1.10")
]
```

**在代码中导入：**
```swift
import KSChart
```

### CocoaPods

继续支持传统方式，在您的 `Podfile` 中添加：

```ruby
pod 'KSChart'
```

然后运行：
```bash
pod install
```

## 开发环境
- Xcode 11.0+
- Swift 5.1+

## 示例
请参考KSKChartView.swift
```swift
class KSKChartView: KSBaseView {
    
    lazy var klineData = [KSChartItem]()
    lazy var configure: KSChartConfigure = KSChartConfigure.init()
    
    weak var delegate: KSKChartViewDelegate?
    
    lazy var chartView: KSKLineChartView = {
        let chartView         = KSKLineChartView(frame: self.bounds)
        let style             = configure.loadConfigure()
        chartView.style       = style
        chartView.delegate    = self
        self.addSubview(chartView)
        return chartView
    }()
    ......
}
```

## 版本更新说明
```
5.1.8 稳定版
1、进一步优化CPU和内存占用率，CPU使用率降低20%以上；
2、精简代码KSKLineChartView代码；
3、分层管理k线视图的绘制内容；
4、重构边框与Y轴数值绘制代码；
5、修复已知bug。

5.1.9
1、新增WR/AVG指标
2、精简代码
3、优化API

5.1.10
1、优化时间线逻辑
2、精简代理方法
3、对外API统一风格

```

## 下个版本
```
1、重新添加最大最小值的显示
```

反馈/技术交流群:902071358

[![Powered by DartNode](https://dartnode.com/branding/DN-Open-Source-sm.png)](https://dartnode.com "Powered by DartNode - Free VPS for Open Source")
