//
//  WYAlertViewController.m
//  WYIOSProject
//
//  Created by wangyuan on 2018/8/3.
//  Copyright © 2018年 wangyuan. All rights reserved.
//

#import "WYAlertViewController.h"

@implementation WYAlertViewController


+ (void)getAlertControllerWithTitle:(NSString *)title
                            message:(NSString *)message
                          sureTitle:(NSString *)sureTitle
                        cancelTitle:(NSString *)cancelTitle
                     viewController:(UIViewController *)aViewController
                         sureAction:(SureAction)aSureAction
                       cancelAction:(CancelAction)aCancelAction {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:sureTitle style:UIAlertActionStyleDestructive handler:aSureAction];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:aCancelAction];
    
    [alertController addAction:sureAction];
    [alertController addAction:cancelAction];
    
    [aViewController presentViewController:alertController animated:YES completion:nil];
}

+ (void)getTipAlertControllerWithTitle:(NSString *)title
                               message:(NSString *)message
                           cancelTitle:(NSString *)cancelTitle
                        viewController:(UIViewController *)aViewController
                           cancelBlock:(CancelAction)aCancelAction {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:aCancelAction];
    
    [alertController addAction:cancelAction];
    
    [aViewController presentViewController:alertController animated:YES completion:nil];
}


@end
