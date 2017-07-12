# CLUIKit介绍文档

## CLCollectionView

### CLCollectionViewController


​	主要是添加了`MJRefresh`, 并且默认提供了一个`UICollectionViewFlowLayout`, 使得刚开始就算没有`UICollectionViewFlowLayout`也不会造成`Crash`的问题.

### CLCollectionViewBaseModel

默认提供一个初始化方法:

```objective-c
- (instancetype)initCollectionViewBaseModelWithController:(CLCollectionViewController *)viewController;
```

​	主要是为了减少`CLCollectionViewController`里面的代码, 作为`CLCollectionViewController`连接`Delegate`和`DataSource`的主要桥梁.

### CLCollectionViewDelegate

默认提供一个初始化方法:

```objective-c
- (instancetype)initCollectionViewDelegateWithViewModel:(CLCollectionViewBaseModel *)viewModel;
```

​	`CLCollectionViewDelegate`遵守了`UICollectionViewDelegate`协议, 默认不实现任何方代理方法.

### CLCollectionViewDataSource

默认提供一个初始化方法:

```objective-c
- (instancetype)initCollectionViewDataSourceWithViewModel:(CLCollectionViewBaseModel *)viewModel;
```

​	该`CLCollectionViewDataSource`遵守了`UICollectionViewDataSource`协议, 默认返回的`Item`个数为`CLCollectionViewBaseModel`的`cl_dataSource`数组的个数, `Item`的复用标识为`UICollectionViewCell`.

---

## CLTableViewController

