//
//  WYChatToolBarViewController.m
//  WYIOSProject
//
//  Created by wangyuan on 2018/6/1.
//  Copyright © 2018年 wangyuan. All rights reserved.
//

#import "WYChatToolBarViewController.h"
#import "WYChatToolBar.h"
#import "WYChatMoreView.h"
#import "WYChatFaceView.h"

@interface WYChatToolBarViewController ()<WYChatToolBarDelegate>

@property (nonatomic, assign) CGRect keyboardFrame;

@property (nonatomic, strong) WYChatToolBar *chatBar;
@property (nonatomic, strong) WYChatMoreView *chatMoreView;
@property (nonatomic, strong) WYChatFaceView *chatFaceView;
@end

@implementation WYChatToolBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configUI];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardFrameWillChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
}

- (void)configUI {
    [self.view addSubview:self.chatBar];

    [self makeConstraints];
}

- (void)makeConstraints {
    WS(ws);
    [self.view addSubview:self.chatMoreView];
    [self.view addSubview:self.chatBar];

    [self.chatMoreView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(@(kTabBarHeight));
        make.left.equalTo(ws.view);
        make.width.mas_equalTo(@(kScreenWidth));
        make.height.mas_equalTo(@(kChatBarHeight));
    }];
    [self.chatBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(ws.view);
        make.height.mas_equalTo(@(kTabBarHeight));
    }];
}


- (WYChatToolBar *)chatBar {
    if (!_chatBar) {
        _chatBar = [WYChatToolBar new];
        
        _chatBar.delegate = self;
        
    }
    return _chatBar;
}

- (WYChatMoreView *)chatMoreView {
    if (!_chatMoreView) {
        _chatMoreView = [WYChatMoreView new];
    }
    return _chatMoreView;
}

- (WYChatFaceView *) chatFaceView {
    if (!_chatFaceView) {
        _chatFaceView = [[WYChatFaceView alloc] initWithFrame:CGRectMake(0, kTabBarHeight, kScreenWidth, kChatBarHeight)];
    }
    return _chatFaceView;
}


#pragma mark- Private methods

- (void)keyboardWillHide:(NSNotification *)notification
{
    self.keyboardFrame = CGRectZero;
   
}

- (void)keyboardFrameWillChange:(NSNotification *)notification
{
    self.keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    if (self.chatBar.status == ChatToolBarStatusShowKeyboard && self.keyboardFrame.size.height <= kChatBarHeight) {
        return;
    }
    else if ((self.chatBar.status == ChatToolBarStatusShowFace || self.chatBar.status == ChatToolBarStatusShowMore) && self.keyboardFrame.size.height <= kChatBarHeight) {
        return;
    }
    
    if (self.chatDelegate && [self.chatDelegate respondsToSelector:@selector(didChangeChatToolBarHeight:)]) {
        [self.chatDelegate didChangeChatToolBarHeight:self.keyboardFrame.size.height+kTabBarHeight];
        self.chatBar.status = ChatToolBarStatusShowKeyboard;
    }
}

- (void)adjustToolBarHeight:(CGFloat)barHeight {
    if (self.chatDelegate && [self.chatDelegate respondsToSelector:@selector(didChangeChatToolBarHeight:)]) {
        [self.chatDelegate didChangeChatToolBarHeight:barHeight];
    }
}


#pragma mark- WYChatToolBarDelegate

- (void)chatToolBar:(WYChatToolBar *)toolBar SendTextMessage:(NSString *)textStr {
    if (self.chatDelegate && [self.chatDelegate respondsToSelector:@selector(sendTextMessage:)]) {
        [self.chatDelegate sendTextMessage:textStr];
    }
}

- (void)chatToolBar:(WYChatToolBar *)toolBar ChangeStatusFrom:(ChatToolBarStatus)fromStatus To:(ChatToolBarStatus)toStatus {
    WS(ws);
    if (toStatus == ChatToolBarStatusShowKeyboard) {
        DELAYEXECUTE(0.5,
                     [self.chatMoreView removeFromSuperview];
                     [self.chatFaceView removeFromSuperview];
                     );
    } else if (toStatus == ChatToolBarStatusShowVoice) {
        [UIView animateWithDuration:0.3 animations:^{
            [self adjustToolBarHeight:kTabBarHeight];
        } completion:^(BOOL finished) {
            [self.chatMoreView removeFromSuperview];
            [self.chatFaceView removeFromSuperview];
        }];
    } else if (toStatus == ChatToolBarStatusShowFace) {
        if (fromStatus == ChatToolBarStatusShowVoice || fromStatus == ChatToolBarStatusNothing) {
            
            [self.view addSubview:self.chatFaceView];
            [self.chatFaceView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(@(kTabBarHeight));
                make.left.equalTo(ws.view);
                make.width.mas_equalTo(@(kScreenWidth));
                make.height.mas_equalTo(@(kChatBarHeight));
            }];
            [UIView animateWithDuration:0.3 animations:^{
                [self adjustToolBarHeight:kTabBarHeight+kChatBarHeight];
            }];
        } else {
            [self.view addSubview:self.chatFaceView];
            [self.chatFaceView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(@(kTabBarHeight));
                make.left.equalTo(ws.view);
                make.width.mas_equalTo(@(kScreenWidth));
                make.height.mas_equalTo(@(kChatBarHeight+kTabBarHeight));
            }];
            [UIView animateWithDuration:0.2 animations:^{
                [self.chatFaceView mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.height.mas_equalTo(@(kChatBarHeight));
                }];
            } completion:^(BOOL finished) {
                [self.chatMoreView removeFromSuperview];
            }];
            
            if (fromStatus != ChatToolBarStatusShowMore) {
                [UIView animateWithDuration:0.2 animations:^{
                    [self adjustToolBarHeight:kTabBarHeight+kChatBarHeight];
                }];
            }
        }
    } else if (toStatus == ChatToolBarStatusShowMore) {
        if (fromStatus == ChatToolBarStatusShowVoice || fromStatus == ChatToolBarStatusNothing) {
            [self.view addSubview:self.chatMoreView];
            [self.chatMoreView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(@(kTabBarHeight));
                make.left.equalTo(ws.view);
                make.width.mas_equalTo(@(kScreenWidth));
                make.height.mas_equalTo(@(kChatBarHeight));
            }];

            [UIView animateWithDuration:0.3 animations:^{
                [self adjustToolBarHeight:kTabBarHeight+kChatBarHeight];
            }];
        } else {
            [self.view addSubview:self.chatMoreView];
            [self.chatMoreView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(@(kTabBarHeight));
                make.left.equalTo(ws.view);
                make.width.mas_equalTo(@(kScreenWidth));
                make.height.mas_equalTo(@(kChatBarHeight+kTabBarHeight));
            }];
            
            [UIView animateWithDuration:0.3 animations:^{
                [self.chatMoreView mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.height.mas_equalTo(@(kChatBarHeight));
                }];
            } completion:^(BOOL finished) {
                [self.chatFaceView removeFromSuperview];
            }];
            
            [UIView animateWithDuration:0.2 animations:^{
                [self adjustToolBarHeight:kTabBarHeight+kChatBarHeight];
            }];
        }
    }
}

- (void)chatToolBar:(WYChatToolBar *)toolBar ChangeToolBarHeight:(CGFloat)height {
    
}





@end
