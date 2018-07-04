//
//  WYBaseViewController.h
//  WYIOSProject
//
//  Created by wangyuan on 2018/1/10.
//  Copyright © 2018年 wangyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>
#import "UIFont+Additions.h"
#import "WYColorConfiguration.h"

@interface WYBaseViewController : UIViewController

@property (nonatomic, strong) UIButton *leftBtn;
@property (nonatomic, strong) UIButton *rightBtn;

- (void)showNavigationBarBackButton;
- (void)showNavigationBarLeftButtonWithTitle:(NSString *)title;
- (void)showNavigationBarLeftButtonWithImageName:(NSString *)imageName;
- (void)showNavigationBarRightButtonWithTitle:(NSString *)title;
- (void)showNavigationBarRightButtonWithImageName:(NSString *)imageName;

//button action
- (void)backAction:(UIButton *)button;
- (void)clickLeftButton:(UIButton *)button;
- (void)clickRightButton:(UIButton *)button;
@end
