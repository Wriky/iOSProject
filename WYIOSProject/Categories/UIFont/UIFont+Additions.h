//
//  UIFont+Additions.h
//  xxg
//
//  Created by chenweiqiang on 2017/6/27.
//  Copyright © 2017年 AS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (Additions)

+ (UIFont *)systemFontSizeLayout:(CGFloat)fontSize;
+ (UIFont *)boldSystemFitSizeLayout:(CGFloat)fontSize;
+ (UIFont *)CFRegular:(CGFloat)fontSize withName:(NSString *)name;

// PingFangSC-Light
+ (id)CFLight:(float)size;
// PingFangSC-Medium
+ (id)CFMedium:(float)size;
// PingFangSC-Semibold
+ (id)CFSemibold:(float)size;
// PingFangSC-Ultralight
+ (id)CFUltralight:(float)size;
// PingFangSC-Thin
+ (id)CFThin:(float)size;
// PingFangSC-Regular
+ (id)CFRegular:(float)size;
//.SFNSDisplay-Regular
+ (id)CFSFNSRegular:(float)size;

+ (id)CFBold:(float)size ;
@end
