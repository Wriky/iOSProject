//
//  WYScanManager.m
//  WYIOSProject
//
//  Created by wangyuan on 2018/8/3.
//  Copyright © 2018年 wangyuan. All rights reserved.
//

#import "WYScanManager.h"
#import "WYAlertViewController.h"
#import "WYScanPermission.h"
#import "WYScanReaderViewController.h"

@implementation WYScanManager


+ (void)startScanCode:(WYBaseViewController *)fromVC
                 Type:(NSString *)scanType
              Success:(ScanSuccessBlock)success
              Failure:(ScanFailureBlock)failure {
    
    [WYScanPermission authorizeWithType:WYPermissionType_Camera Completion:^(BOOL granted, BOOL firstTime) {
        if(granted) {
            WYScanReaderViewController *vc = [WYScanReaderViewController new];
            vc.hidesBottomBarWhenPushed = YES;
            
            [vc setCompletionWithBlock:^(id  _Nullable resultParam) {
                success(resultParam);
            }];
            
            [fromVC.navigationController pushViewController:vc animated:NO];
        } else {
            [WYAlertViewController getTipAlertControllerWithTitle:@"未获得授权使用相机，请到设置-隐私-相机-威马开启权限" message:nil cancelTitle:@"好的" viewController:fromVC cancelBlock:^(UIAlertAction *action) {
                NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                if ([[UIApplication sharedApplication] canOpenURL:url]) {
                    [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
                }
                
            }];
        }
    }];
}


@end
