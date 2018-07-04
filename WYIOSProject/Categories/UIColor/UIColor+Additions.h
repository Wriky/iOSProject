//
//  UIColor+Additions.h
//  xxg
//
//  Created by chenweiqiang on 2017/6/27.
//  Copyright © 2017年 AS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Additions)

+ (UIColor *)colorWithHexString:(NSString *)string;
+ (UIColor *)colorWithHexString:(NSString *)string withAlpha:(CGFloat)alpha;

@end
