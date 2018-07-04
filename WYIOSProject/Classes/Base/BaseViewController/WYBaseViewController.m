//
//  WYBaseViewController.m
//  WYIOSProject
//
//  Created by wangyuan on 2018/1/10.
//  Copyright © 2018年 wangyuan. All rights reserved.
//

#import "WYBaseViewController.h"

@interface WYBaseViewController ()

@end

@implementation WYBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];

    [self customNavigationBar];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];    
}

- (void)customNavigationBar {
    
    UIButton *leftBtn = [UIButton buttonWithType:0];
    leftBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    leftBtn.frame = CGRectMake(0, 2, 40, 40);
    UIBarButtonItem *barButtonLeft = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = barButtonLeft;
    self.leftBtn = leftBtn;
    
    UIButton *rightBtn = [UIButton buttonWithType:0];
    rightBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    rightBtn.frame = CGRectMake(0, 2, 80, 40);
    UIBarButtonItem *barButtonRight = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItems = @[barButtonRight];
    self.rightBtn = rightBtn;
}

- (void)showNavigationBarBackButton {
    [self.leftBtn setImage:[UIImage imageNamed:@"icon_back"] forState:UIControlStateNormal];
    [self.leftBtn addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)showNavigationBarLeftButtonWithTitle:(NSString *)title {
    [self.leftBtn setTitle:title forState:UIControlStateNormal];
    [self.leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.leftBtn.titleLabel.font = [UIFont systemFontOfSize:14.f];
    [self.leftBtn addTarget:self action:@selector(clickLeftButton:) forControlEvents:UIControlEventTouchUpInside];
}


- (void)showNavigationBarLeftButtonWithImageName:(NSString *)imageName {
    [self.leftBtn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [self.leftBtn addTarget:self action:@selector(clickLeftButton:) forControlEvents:UIControlEventTouchUpInside];
}


- (void)showNavigationBarRightButtonWithTitle:(NSString *)title {
    [self.rightBtn setTitle:title forState:UIControlStateNormal];
    self.rightBtn.titleLabel.font = [UIFont systemFontOfSize:14.f];
    [self.rightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.rightBtn addTarget:self action:@selector(clickRightButton:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)showNavigationBarRightButtonWithImageName:(NSString *)imageName {
    [self.rightBtn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [self.rightBtn addTarget:self action:@selector(clickRightButton:) forControlEvents:UIControlEventTouchUpInside];
}


#pragma mark - Action
- (void)backAction:(UIButton *)button {
    [self.view endEditing: YES];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)clickLeftButton:(UIButton *)button {
    
}

- (void)clickRightButton:(UIButton *)button {
    
}


@end
