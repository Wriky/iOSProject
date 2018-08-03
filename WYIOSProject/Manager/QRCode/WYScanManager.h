//
//  WYScanManager.h
//  WYIOSProject
//
//  Created by wangyuan on 2018/8/3.
//  Copyright © 2018年 wangyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WYBaseViewController.h"


typedef void(^ScanSuccessBlock)(id response);
typedef void(^ScanFailureBlock)(id response);

@interface WYScanManager : NSObject

+ (void)startScanCode:(WYBaseViewController *)fromVC
                 Type:(NSString *)scanType
              Success:(ScanSuccessBlock)success
              Failure:(ScanFailureBlock)failure;


@end
