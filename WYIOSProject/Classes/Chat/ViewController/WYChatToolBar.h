//
//  WYChatToolBar.h
//  WYIOSProject
//
//  Created by wangyuan on 2018/5/31.
//  Copyright © 2018年 wangyuan. All rights reserved.
//

#import "WYBaseView.h"
@class WYChatToolBar;

@protocol WYChatToolBarDelegate<NSObject>


/**
 键盘状态变更

 @param toolBar toolBar
 @param fromStatus 起始状态
 @param toStatus 目标状态
 */
- (void)chatToolBar:(WYChatToolBar *)toolBar ChangeStatusFrom:(ChatToolBarStatus)fromStatus To:(ChatToolBarStatus)toStatus;

/**
 发送消息

 @param toolBar toolBar
 @param textStr 消息内容
 */
- (void)chatToolBar:(WYChatToolBar *)toolBar SendTextMessage:(NSString *)textStr;


/**
 改变toolBar高度

 @param toolBar toolBar
 @param height 高度值
 */
- (void)chatToolBar:(WYChatToolBar *)toolBar ChangeToolBarHeight:(CGFloat)height;

@end

@interface WYChatToolBar : WYBaseView

@property (nonatomic, assign) ChatToolBarStatus status;

@property (nonatomic, weak) id <WYChatToolBarDelegate>delegate;

@end
