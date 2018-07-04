//
//  UITextField+Additions.m
//  xxg
//
//  Created by chenweiqiang on 2017/7/10.
//  Copyright © 2017年 AS. All rights reserved.
//

#import "UITextField+Additions.h"

@implementation UITextField (Additions)

- (BOOL)isChineseInputType {
    if (self.keyboardType == UIKeyboardTypeDefault) {
        if ([[[self textInputMode] primaryLanguage] containsString:@"zh"]) {
            return YES;
        } else {
            return NO;
        }
    } else {
        return NO;
    }
    
}

@end
