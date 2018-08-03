//
//  WYAlertViewController.h
//  WYIOSProject
//
//  Created by wangyuan on 2018/8/3.
//  Copyright © 2018年 wangyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  确定block模块
 *
 *  @param action 执行确定的操作
 */
typedef void(^SureAction)(UIAlertAction *action);

/**
 *  取消block模块
 *
 *  @param action 执行取消的操作
 */
typedef void(^CancelAction)(UIAlertAction *action);

/**
 *  点击的action数组
 *
 *  @return 是要添加的actions
 */
typedef NSArray *(^SheetAction)(void);

@interface WYAlertViewController : NSObject


/**
 *  选择按键提示框
 *
 *  @param title            提示标题
 *  @param message          提示内容
 *  @param sureTitle        确认按钮标题
 *  @param cancelTitle      取消按钮标题
 *  @param aViewController  需要显示提示框的ViewController
 *  @param aSureAction      确认按键执行block
 *  @param aCancelAction    取消按键执行block
 *
 */

+ (void)getAlertControllerWithTitle:(NSString *)title
                            message:(NSString *)message
                          sureTitle:(NSString *)sureTitle
                        cancelTitle:(NSString *)cancelTitle
                     viewController:(UIViewController *)aViewController
                         sureAction:(SureAction)aSureAction
                       cancelAction:(CancelAction)aCancelAction;


/**
 *  单按键提示框
 *
 *  @param title            提示标题
 *  @param message          提示内容
 *  @param cancelTitle      取消按钮标题
 *  @param aCancelAction    取消按键执行block
 *  @param aViewController  需要显示提示框的ViewController
 *
 */

+ (void)getTipAlertControllerWithTitle:(NSString *)title
                               message:(NSString *)message
                           cancelTitle:(NSString *)cancelTitle
                        viewController:(UIViewController *)aViewController
                           cancelBlock:(CancelAction)aCancelAction;


@end

