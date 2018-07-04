//
//  WYConfiguration.h
//  WYIOSProject
//
//  Created by wangyuan on 2018/5/25.
//  Copyright © 2018年 wangyuan. All rights reserved.
//

#ifndef WYConfiguration_h
#define WYConfiguration_h


#define WS(weakSelf)  __weak __typeof(self)weakSelf = self;

#define kVerifyButtonRefreshTime    60

//屏幕宽高
#define kScreenWidth    [UIScreen mainScreen].bounds.size.width
#define kScreenHeight   [UIScreen mainScreen].bounds.size.height

#define kTabBarHeight   (([UIScreen mainScreen].bounds.size.height >= 812)?83.f:49.f)

#define kChatBarHeight 215.f
#define kNormalNavBarHeight  64.f

#define kNavBarHeight   (([UIScreen mainScreen].bounds.size.height >= 812)?99.f:87.f)
#define kKeyboardHeight   (([UIScreen mainScreen].bounds.size.width <= 375)?258.f:271.f)


//适配屏幕大小
#define kFitSize(Int)   ([UIScreen mainScreen].bounds.size.width*Int/375)
#define kFitHeightSize(Int)   ([UIScreen mainScreen].bounds.size.height*Int/667)
#define kFit320Size(Int)   (([UIScreen mainScreen].bounds.size.width == 320 )?kFitSize(Int)/1.732:kFitSize(Int))

// 延迟调用
#define DELAYEXECUTE(delayTime,func) (dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{func;}))

//获取系统版本
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)


//适配iPhoneX及iOS11的ScrollView位置下移
#define  adjustsScrollViewInsets_NO(scrollView,vc)\
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
if ([UIScrollView instancesRespondToSelector:NSSelectorFromString(@"setContentInsetAdjustmentBehavior:")]) {\
[scrollView   performSelector:NSSelectorFromString(@"setContentInsetAdjustmentBehavior:") withObject:@(2)];\
} else {\
vc.automaticallyAdjustsScrollViewInsets = NO;\
}\
_Pragma("clang diagnostic pop") \
} while (0)


#define kTransitionTimeShow    0.3
#define kTransitionTimeHidden  0.5
#define kPopupNormalWidth     kFitSize(304)
#define kPopupNormalHeight    kFitSize(385)

//lsots tip content

#define kSlotsChooseTipContent(type,prefix,des) [NSString stringWithFormat:@"欢迎您，%@\n您将加入%@阵营\n与我们一起%@",type,prefix,des];


#endif /* Configuration_h */

