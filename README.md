# CLFoundation

CLFoundation是对系统的Foundation库的一些扩充, 比如NSString.

### Pods管理

> pod 'CLFoundation', '~> 1.4.0'

CLFoundation最新的地址: https://github.com/CainLuo/CLFoundation

# CLUIKit

`CLUIKit`是对系统`UIKit`库的一些扩充, 比如`UIColor`, `UIDevice`, `UIScreen`, 同时这里也有其他第三方的开源库,

### Pods管理

> pod 'CLUIKit', '~> 1.5.5'

CLUIKit最新的地址: https://github.com/CainLuo/CLUIKit


# ~~OtherFramework(已删, 第三方库改用Pod)~~

`OtherFramework`都是第三方开源库, 并没有纳入到`CLKit`库里, 目前有的第三方开源库:

[CYLTabBarController](https://github.com/ChenYilong/CYLTabBarController)

[IQKeyboardManager](https://github.com/hackiftekhar/IQKeyboardManager)

[JQFMDB](https://github.com/gaojunquan/JQFMDB)

[Masonry](https://github.com/SnapKit/Masonry)

[SDCycleScrollView](https://github.com/gsdios/SDCycleScrollView)

[SDWebImage](https://github.com/rs/SDWebImage)

[YYModel](https://github.com/ibireme/YYModel)

感谢以上各位大神的无私分享, 无关排名.

# SimpleProject

SimpleProject是一个简单的事例Demo, 一些比较复杂的使用, 都会在这里有所展示.



# 合并脚本

让`Framework`可以在模拟器与真机上运行, 所以这里我们需要借助一个脚本:

```javascript
if [ "${ACTION}" = "build" ]
then
INSTALL_DIR=${SRCROOT}/Products/${PROJECT_NAME}.framework

DEVICE_DIR=${BUILD_ROOT}/${CONFIGURATION}-iphoneos/${PROJECT_NAME}.framework

SIMULATOR_DIR=${BUILD_ROOT}/${CONFIGURATION}-iphonesimulator/${PROJECT_NAME}.framework


if [ -d "${INSTALL_DIR}" ]
then
rm -rf "${INSTALL_DIR}"
fi

mkdir -p "${INSTALL_DIR}"

cp -R "${DEVICE_DIR}/" "${INSTALL_DIR}/"
#ditto "${DEVICE_DIR}/Headers" "${INSTALL_DIR}/Headers"

lipo -create "${DEVICE_DIR}/${PROJECT_NAME}" "${SIMULATOR_DIR}/${PROJECT_NAME}" -output "${INSTALL_DIR}/${PROJECT_NAME}"

#open "${DEVICE_DIR}"
open "${SRCROOT}/Products"
fi
```

# 去除i386等模拟器信息

由于框架加入了`i386`导致上传`ipa`文件的时候被拒, 这时候我们在`Targets` -> `Build Phases` 添加一个`Run Script`, 然后再把下面的脚本添加进去, 再打包上传就好了.

```javascript
APP_PATH="${TARGET_BUILD_DIR}/${WRAPPER_NAME}"

# This script loops through the frameworks embedded in the application and
# removes unused architectures.
find "$APP_PATH" -name '*.framework' -type d | while read -r FRAMEWORK
do
FRAMEWORK_EXECUTABLE_NAME=$(defaults read "$FRAMEWORK/Info.plist" CFBundleExecutable)
FRAMEWORK_EXECUTABLE_PATH="$FRAMEWORK/$FRAMEWORK_EXECUTABLE_NAME"
echo "Executable is $FRAMEWORK_EXECUTABLE_PATH"

EXTRACTED_ARCHS=()

for ARCH in $ARCHS
do
echo "Extracting $ARCH from $FRAMEWORK_EXECUTABLE_NAME"
lipo -extract "$ARCH" "$FRAMEWORK_EXECUTABLE_PATH" -o "$FRAMEWORK_EXECUTABLE_PATH-$ARCH"
EXTRACTED_ARCHS+=("$FRAMEWORK_EXECUTABLE_PATH-$ARCH")
done

echo "Merging extracted architectures: ${ARCHS}"
lipo -o "$FRAMEWORK_EXECUTABLE_PATH-merged" -create "${EXTRACTED_ARCHS[@]}"
rm "${EXTRACTED_ARCHS[@]}"

echo "Replacing original executable with thinned version"
rm "$FRAMEWORK_EXECUTABLE_PATH"
mv "$FRAMEWORK_EXECUTABLE_PATH-merged" "$FRAMEWORK_EXECUTABLE_PATH"

done
```


# 注意

​	本框架纯属是为了加快自己的项目开发速度而封装的, 同时也是为了可以和大家交流, 如需进行商业行为, 或者转发, 请联系作者, 否则一旦发现, 将追究法律责任.
