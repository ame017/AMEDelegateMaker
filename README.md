# AMEDelegateMaker
A Objective-c protocol &amp; delegate maker without resign for Xcode<br>

![](Display/ADM-intro.png)

[![996.icu](https://img.shields.io/badge/link-996.icu-red.svg)](https://996.icu) [![LICENSE](https://img.shields.io/badge/license-NPL%20(The%20996%20Prohibited%20License)-blue.svg)](https://github.com/996icu/996.ICU/blob/master/LICENSE)

##### ![cn](https://raw.githubusercontent.com/gosquared/flags/master/flags/flags/shiny/24/China.png) Chinese (Simplified): [中文说明](README_chs.md)

## What is this?
This plug-in can help you create protocol & delegate easier.

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
1. [Download](product/AMEDelegateMaker.zip)<br>
2. Enable this plug-in in setting<br>
![](Display/ext.png)
3. You can Bind shortcuts in Xcode setting <br>
![](Display/binding.png)

## Trouble Shooting
If your Xcode is 8.0+.<br>
Please install macOS Sierra (version 10.12) if your macOS is 10.11.<br>

## Other project recommendations
[AMECategoryMaker](https://github.com/ame017/AMECategoryMaker) <br>
A category property maker without resigin<br>
[AMEGetterMaker](https://github.com/ame017/AMEGetterMaker) <br>
A lazyload getter maker without resign for Xcode
