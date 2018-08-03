//
//  WYCheckout.m
//  xxg
//
//  Created by chenweiqiang on 2017/6/13.
//  Copyright © 2017年 AS. All rights reserved.
//

#import "WYCheckout.h"
#import "NSString+Addtions.h"
#import "Reachability.h"

@implementation WYCheckout

+ (BOOL)isPhone:(NSString *)phone {
    NSString *phoneStr = [phone stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    if (phoneStr.length != 11) {
        return NO;
    } else {
        NSString *numRule = @"^[1]\\d{10}$";
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numRule];
        
        return [pred evaluateWithObject:phoneStr];
    }
}



+ (BOOL)isUpToStandardPassword:(NSString *)password {
    NSString *predicateStr = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,20}$";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", predicateStr];
    
    return [pred evaluateWithObject:password];
}

+ (BOOL)isVerifyCode:(NSString *)verifyCode {
    
    if (verifyCode.length != 6) {
        return NO;
    } else {
        NSString *predString = @"^[0-9]{6}$";
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",predString];
        
        return [pred evaluateWithObject:verifyCode];
    }
    
}

+ (BOOL)stringIsExist:(NSString *)targetStr {
    if ([targetStr isKindOfClass:[NSString class]]) {
        if (targetStr.length > 0) {
            return YES;
        }
    }
    
    return NO;

}

+ (BOOL)accurateVerifyIDCardNumber:(NSString *)value {
    value = [value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    int length =0;
    if (!value) {
        return NO;
    }else {
        length = (int)value.length;
        
        if (length !=15 && length !=18) {
            return NO;
        }
    }
    
    NSString *regexStr = @"^\\d{17}[0-9Xx]{1}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regexStr];
    
    return [pred evaluateWithObject:value];
}

+ (BOOL)isEmailAddress:(NSString *)email {
    NSString *emailRegex = @"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",emailRegex];
    
    return [pred evaluateWithObject:email];
}

+ (BOOL)networkingEnable {
    Reachability *conn = [Reachability reachabilityForInternetConnection];
    
    // 3.判断网络状态
    if ( [conn currentReachabilityStatus] == NotReachable) {
       // [AASHudProgress presentSheetToCurrentKeyWindow:@"当前网络不可用，请检查网络链接状态"];

        return NO;
    }
    
    return YES;
}

@end
