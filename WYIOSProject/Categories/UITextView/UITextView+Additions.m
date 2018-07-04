//
//  UITextView+Additions.m
//  xxg
//
//  Created by chenweiqiang on 2017/7/10.
//  Copyright © 2017年 AS. All rights reserved.
//

#import "UITextView+Additions.h"

@implementation UITextView (Additions)

- (BOOL)isChineseInputType {
    if ([[[self textInputMode] primaryLanguage] containsString:@"zh"]) {
        return YES;
    } else {
        return NO;
    }
}

@end
