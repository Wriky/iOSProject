//
//  WYToolKit.m
//  WYIOSProject
//
//  Created by wangyuan on 2018/6/15.
//  Copyright © 2018年 wangyuan. All rights reserved.
//

#import "WYToolKit.h"

@implementation WYToolKit

+ (NSInteger)currentMessageTime
{
    NSTimeInterval time = [[NSDate date] timeIntervalSince1970];
    NSInteger iTime     = (NSInteger)(time * 1000);
    return iTime;
}

@end
