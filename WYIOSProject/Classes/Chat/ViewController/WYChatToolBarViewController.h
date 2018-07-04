//
//  WYChatToolBarViewController.h
//  WYIOSProject
//
//  Created by wangyuan on 2018/6/1.
//  Copyright © 2018年 wangyuan. All rights reserved.
//

#import "WYBaseViewController.h"

@protocol WYChatToolBarViewControllerDelegate<NSObject>

- (void)didChangeChatToolBarHeight:(CGFloat)height;
- (void)sendTextMessage:(NSString *)textStr;
- (void)sendImageMessage:(UIImage *)image imagePath:(NSString *)imagePath;
- (void)sendVoiceMessage:(NSString *)voicePath;

@end

@interface WYChatToolBarViewController : WYBaseViewController

@property (nonatomic, weak) id <WYChatToolBarViewControllerDelegate> chatDelegate;

@end
