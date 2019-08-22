# AMEDelegateMaker
一个无需resgin的protocol和delegate生成器<br>

![](Display/ADM-intro.png)

[![996.icu](https://img.shields.io/badge/link-996.icu-red.svg)](https://996.icu) [![LICENSE](https://img.shields.io/badge/license-NPL%20(The%20996%20Prohibited%20License)-blue.svg)](https://github.com/996icu/996.ICU/blob/master/LICENSE)



## What is this?
可以生成代理和协议

e.g.
```
@interface HKRecentlyDealHeaderView : HKBaseView
```
↓↓↓
```
@class HKRecentlyDealHeaderView;
@protocol HKRecentlyDealHeaderViewDelegate <NSObject>

@required

@optional

- (void)hkrecentlyDealHeaderView:(HKRecentlyDealHeaderView *)view;

@end
@interface HKRecentlyDealHeaderView : HKBaseView

@property (nonatomic, weak) id<HKRecentlyDealHeaderViewDelegate> delegate;

@end
```
![](Display/delegateMaker.gif)

## Installation
1. [点击这里下载](Product/AMEDelegateMaker.zip)<br>
2. 在设置中启用本扩展<br>
![](Display/ext.png)
3. 你可以自己加个快捷键 <br>
![](Display/binding.png)

## 问题
如果你使用Xcode8.0+.<br>
请把系统版本升级到10.12以上.<br>

## 其他推荐
[AMECategoryMaker](https://github.com/ame017/AMECategoryMaker) <br>
类别(category)生成器<br>
[AMEGetterMaker](https://github.com/ame017/AMEGetterMaker) <br>
懒加载生成器
