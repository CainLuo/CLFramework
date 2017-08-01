//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  CLDefine.h
//
//  Created by Cain on 2016/12/7.
//  Copyright © 2016年 Cain. All rights reserved.
//

#ifndef CLDefine_h
#define CLDefine_h

#define CL_WEAK_SELF(type)  __weak __typeof(&*self)weakSelf = self
#define CL_STRONG_SELF(type)  __strong __typeof(&*self)weakSelf = self

#define CL_GET_METHOD_RETURN_OBJC(objc) if (objc) return objc

#define CL_ANGLE_TO_RADIAN(x) (M_PI * (x) / 180.0)
#define CL_RADIAN_TO_ANGLE(radian) (radian * 180.0) / (M_PI)

#ifdef DEBUG
    #define NSLog(...) NSLog(@"%s 第%d行 \n %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
    #define NSLog(...)
#endif

#endif /* CLDefine_h */
