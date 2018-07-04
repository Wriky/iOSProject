//
//  WYMessageViewController.m
//  WYIOSProject
//
//  Created by wangyuan on 2018/5/31.
//  Copyright © 2018年 wangyuan. All rights reserved.
//

#import "WYMessageViewController.h"
#import "WYChatViewController.h"

@interface WYMessageViewController ()

@property (nonatomic, strong) UIButton *chatButton;

@end

@implementation WYMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.chatButton];
}

- (UIButton *)chatButton {
    if (_chatButton == nil) {
        _chatButton = [[UIButton alloc] init];
        _chatButton.frame = CGRectMake(100, 100, 60, 40);
        [_chatButton setTitle:@"聊天" forState:UIControlStateNormal];
        [_chatButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_chatButton addTarget:self action:@selector(chatButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _chatButton;
}

- (void)chatButtonClick:(UIButton *)button {
    WYChatViewController *vc = [WYChatViewController new];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}


@end
