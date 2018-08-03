//
//  WYMessageViewController.m
//  WYIOSProject
//
//  Created by wangyuan on 2018/5/31.
//  Copyright © 2018年 wangyuan. All rights reserved.
//

#import "WYMessageViewController.h"
#import "WYChatViewController.h"
#import "WYScanManager.h"

@interface WYMessageViewController ()

@property (nonatomic, strong) UIButton *chatButton;

@property (nonatomic, strong) UIButton *scanButton;


@end

@implementation WYMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.chatButton];
    
    [self.view addSubview:self.scanButton];
    
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

- (UIButton *)scanButton {
    if (!_scanButton) {
        _scanButton = [UIButton buttonWithType:0];
        _scanButton.frame = CGRectMake(100, 200, 60, 40);
        [_scanButton setTitle:@"扫一扫" forState:UIControlStateNormal];
        [_scanButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_scanButton addTarget:self action:@selector(scanButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _scanButton;
}

- (void)chatButtonClick:(UIButton *)button {
    WYChatViewController *vc = [WYChatViewController new];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)scanButtonClick:(UIButton *)button {
    [WYScanManager startScanCode:self Type:nil Success:^(id response) {
        
    } Failure:^(id response) {
        
    }];
    
}



@end
