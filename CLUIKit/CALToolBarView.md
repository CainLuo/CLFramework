# CLToolBarListView

- [作者感言](#作者感言)
- [简介](#简介)
- [使用说明](#使用说明)
- [初始化](#初始化)
- [通用属性](#通用属性)
- [显示样式](#显示样式)
- [通用方法](#通用方法)
- [演示代码](#演示代码)
- [展示效果](#展示效果)

---

### 作者感言

> 如果你有更好的建议或者对这篇文章有不满的地方, 请联系我, 我会参考你们的意见再进行修改, 联系我时, 请备注**`CLToolBarListView `**, 祝大家学习愉快~谢谢~

---
### 简介
> **`CLToolBarListView`**是一个仿**`UISegmentedControl`**的一个**`UI控件`**, 在刚开始设计的时候, 注重点就是为了灵活性, 可以自定义标题颜色, 选中提示条的颜色等等, 目前只有两个样式, 当然, 你可以根据我提供的源码来自行添加你所喜欢的样式

---

## 使用说明

#### 初始化

> 在使用**`CLToolBarListView`**的时候必须得通过以下的初始化方法来进行初始化, 并且**`titleArray`**不能为空, 否则就会**`Crash`**.

```objectivec
/**
 初始化TooBar
 @param frame      设置TooBar的Frame
 @return self
 */
- (instancetype)initToolBarWithFrame:(CGRect)frame;
```

---
### 通用属性

```objectivec
/**
 是否根据按钮宽度自动缩小标题, default: NO
 */
@property (nonatomic, assign) BOOL titleAdjustsFontSizeToFitWidth;

/**
 选中的按钮文字的颜色, default: redColor
 */
@property (nonatomic, strong) UIColor *selectedColor;

/**
 非选中的按钮文字的颜色, default: blackColor
 */
@property (nonatomic, strong) UIColor *deselectColor;

/**
 背景颜色, default: whiteColor
 */
@property (nonatomic, strong) UIColor *barBakcgroundColor;

/**
 底部线条的颜色, default: grayColor
 */
@property (nonatomic, strong) UIColor *bottomLineColor;

/**
 选中按钮提示条的颜色, default: cyanColor
 */
@property (nonatomic, strong) UIColor *selectedLineColor;

/**
 按钮文字大小, default: 16
 */
@property (nonatomic, assign) NSInteger textFont;

/**
 按钮之间的间距, default: 10
 */
@property (nonatomic, assign) CGFloat buttonSpacing;

/**
 是否需要底部线
 */
@property (nonatomic, assign) BOOL isNeedLine;

/**
 是否需要选中提示条
 */
@property (nonatomic, assign) BOOL isNeedSelectedLine;

/**
 当前点击的currentIndex, default: 0
 */
@property (nonatomic, getter=currentIndex) NSInteger currentIndex;
```

---
### 显示样式

> 在这里我提供了两个显示的样式

```objectivec
typedef NS_ENUM(NSInteger, CLToolBarStyle) {
    CLToolBarNormalStyle = 0,
    CLToolBarSeparationStyle
};
```

> 可以通过下面这个属性进行设置, 默认是**`CLToolBarNormalStyle`**

```objectivec
/**
 设置ToolBar显示的样式, default: CLToolBarNormalStyle
 */
@property (nonatomic, assign) CLToolBarStyle toolBarStyle;
```

> **`CLToolBarNormalStyle`**

![1](https://github.com/CainRun/CALToolBarView/blob/master/images-File/CALToolBarNormalStyle.png)

> **`CLToolBarSeparationStyle`**

![2](https://github.com/CainRun/CALToolBarView/blob/master/images-File/CALToolBarSeparationStyle.png)


> 选择样式二的时候, 可通过以下的属性修改显示的颜色

```objectivec
/**
 Seoaration分割线的颜色
 注意: 前提是你设置了toolBarStyle为CLToolBarSeparationStyle才有效, 默认为grayColor
 */
@property (nonatomic, strong) UIColor *separationColor;
```

---
###通用方法

> 首先肯定是最常用的方法**`reloadData`**, 是用来刷新整个**`CLToolBarListView`**数据的方法, 只有调用了这个方法, **`CLToolBarListView`**才会显示对应的数据.
```objectivec
/**
 刷新整个列表
 */
- (void)reloadData;
```

> 以下这个方法是默认选中指定**`Index`**的按钮, 但需要注意一点就是, 必须现有数据才能调用, 否则直接调用时无效的.
```objectivec
/**
 指定当前选中的Button Index
 @param 注意: 使用该方法, 必须先得实现reloadData的方法, 否则不生效
 @param index 指定当前选中的Button Index
 */
- (void)didSelectedButton:(NSInteger)index;
```

> 以下这个方法是获取对应按钮的点击事件, 在这里我就没有使用代理来写, 毕竟写代理会增加更多的代码, 直接用一个**`Block`**就完事
```objectivec
/**
 点击事件Block
 */
@property (nonatomic, copy) void(^clToolBarSelectedBlock)(NSInteger index);
```

---
###演示代码

> 以下就是使用的演示代码, 方便大家直接查看代码

```objectivec
    NSArray *titleArray = @[@"标题一", @"标题二", @"标题三", @"标题四", @"标题五"];
    
    CLToolBarListView *toolBarList = [[CLToolBarListView alloc] initToolBarWithFrame:CGRectMake(0,
                                                                                                250,
                                                                                                self.view.frame.size.width,
                                                                                                40)];
    toolBarList.titleArray = titleArray;
    toolBarList.barBakcgroundColor = [UIColor greenColor];
    toolBarList.selectedLineColor  = [UIColor redColor];
    toolBarList.bottomLineColor    = [UIColor blueColor];
    toolBarList.toolBarStyle       = CLToolBarSeparationStyle;
    toolBarList.separationColor    = [UIColor grayColor];
    
    [toolBarList reloadData];
    [toolBarList didSelectedButton:3];
    
    NSLog(@"currentIndex: %zd", toolBarList.currentIndex);
    
    [toolBarList setClToolBarSelectedBlock:^(NSInteger index) {
        NSLog(@"index: %zd", index);
    }];
    
    [self.view addSubview:toolBarList];
```

---
###展示效果
>请原谅我用的渣渣**`GIF`**录制工具....

![demo](https://github.com/CainRun/CALToolBarView/blob/master/images-File/demo.gif)

