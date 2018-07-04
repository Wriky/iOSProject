//
//  UIFont+Additions.m
//  xxg
//
//  Created by chenweiqiang on 2017/6/27.
//  Copyright © 2017年 AS. All rights reserved.
//

#import "UIFont+Additions.h"
#import "WYConfiguration.h"

@implementation UIFont (Additions)

+ (UIFont *)systemFontSizeLayout:(CGFloat)fontSize {
    
    if (kScreenWidth > 400) {
        return [UIFont systemFontOfSize:fontSize+1];  //6Plus
    }
    if (kScreenWidth < 350 ) {
        return [UIFont systemFontOfSize:fontSize-1]; //5s
    }
    return [UIFont systemFontOfSize:fontSize]; //6
}

+ (UIFont *)boldSystemFitSizeLayout:(CGFloat)fontSize {
    if (kScreenWidth > 400) {
        return [UIFont boldSystemFontOfSize:fontSize+1];  //6Plus
    }
    if (kScreenWidth < 350 ) {
        return [UIFont boldSystemFontOfSize:fontSize-1]; //5s
    }
    return [UIFont boldSystemFontOfSize:fontSize]; //6
}

+ (UIFont *)CFRegular:(CGFloat)fontSize withName:(NSString *)name {
    
    return [self CFRegular:fontSize withName:name PlaceHold:nil];
}

+ (UIFont *)CFRegular:(CGFloat)fontSize withName:(NSString *)name  PlaceHold:(NSString *)pName {
    if (kScreenWidth > 400) {
        return [self getFont:fontSize+1 withName:name PlaceHold:pName];  //6Plus
    }
    if (kScreenWidth < 350 ) {
        return [self getFont:fontSize-1 withName:name PlaceHold:pName]; //5s
    }
    return [UIFont fontWithName:name size:fontSize]; //6
}

+ (UIFont *)getFont:(CGFloat)fontSize withName:(NSString *)name PlaceHold:(NSString *)pName {
    UIFont *font = [UIFont fontWithName:name size:fontSize];
    if (!font) {
        if (pName) {
            font = [UIFont fontWithName:pName size:fontSize];
        } else {
            font = [UIFont systemFontOfSize:fontSize];
        }
    }
    return font;
}

+ (UIFont *)CFBoldSystemFont:(CGFloat)fontSize  {
    if (kScreenWidth > 400) {
        return [self boldSystemFontOfSize:fontSize+1];  //6Plus
    }
    if (kScreenWidth < 350 ) {
        return [self boldSystemFontOfSize:fontSize-1]; //5s
    }
    return [UIFont boldSystemFontOfSize:fontSize]; //6
}

+ (id)CFBold:(float)size {
    return [self  CFBoldSystemFont:size];
}

+ (id)CFLight:(float)size {
    return [self CFRegular:size withName:@"PingFangSC-Light" PlaceHold:@"STHeitiSC-Light"];;
}

+ (id)CFMedium:(float)size {
    return [self CFRegular:size withName:@"PingFangSC-Medium" PlaceHold:@"STHeitiSC-Medium"];;
}

+ (id)CFSemibold:(float)size {
    return [self CFRegular:size withName:@"PingFangSC-Semibold" PlaceHold:@"HelveticaNeue-Bold"];
}

+ (id)CFUltralight:(float)size {
    return [self CFRegular:size withName:@"PingFangSC-Ultralight" PlaceHold:@"STHeitiSC-Light"];
}

+ (id)CFThin:(float)size {
    return [self CFRegular:size withName:@"PingFangSC-Thin" PlaceHold:@"STHeitiSC-Light"];
}

+ (id)CFRegular:(float)size {
    return [self CFRegular:size withName:@"PingFangSC-Regular" PlaceHold:@"STHeitiSC-Light"];
}

+ (id)CFSFNSRegular:(float)size {
    return [self CFRegular:size withName:@".SFNSDisplay-Regular" PlaceHold:@"STHeitiSC-Light"];
}

@end
