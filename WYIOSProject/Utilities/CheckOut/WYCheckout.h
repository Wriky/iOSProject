//
//  WYCheckout.h
//  xxg
//
//  Created by chenweiqiang on 2017/6/13.
//  Copyright © 2017年 AS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYCheckout : NSObject


+ (BOOL)isPhone:(NSString *)phone;

+ (BOOL)isUpToStandardPassword:(NSString *)password;

+ (BOOL)isVerifyCode:(NSString *)verifyCode;

+ (BOOL)stringIsExist:(NSString *)targetStr;

//身份证
+ (BOOL)accurateVerifyIDCardNumber:(NSString *)value;

+ (BOOL)isEmailAddress:(NSString *)email;

+ (BOOL)networkingEnable;
@end
