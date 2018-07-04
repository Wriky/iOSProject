//
//  WYMainTabBarController.m
//  WYIOSProject
//
//  Created by wangyuan on 2018/5/30.
//  Copyright © 2018年 wangyuan. All rights reserved.
//

#import "WYMainTabBarController.h"
#import "WYMessageViewController.h"
#import "WYVideoViewController.h"
#import "WYBaseNavigationController.h"
#import "WYBaseViewController.h"

@interface WYMainTabBarController ()

@end

@implementation WYMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupViewControllers];
}

- (void)setupViewControllers {
    
    WYMessageViewController *msgVC = [WYMessageViewController new];
    WYVideoViewController *videoVC = [WYVideoViewController new];
    
    NSArray *viewCtrls = @[msgVC, videoVC];
    NSMutableArray *mutableNavArr = [NSMutableArray new];
    
    NSArray *itemIcons = @[@"icon_news_normal",  @"icon_car_normal"];
    NSArray *itemHighlightedIcons = @[@"icon_news_pressed",  @"icon_car_pressed"];
    NSArray *itemTitles = @[@"聊天", @"视频"];
    
    for (NSInteger i=0; i<viewCtrls.count; i++) {
        WYBaseViewController *vc = viewCtrls[i];
    
        vc.tabBarItem.title = itemTitles[i];
        [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateSelected];
        vc.tabBarItem.image = [[UIImage imageNamed:itemIcons[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        vc.tabBarItem.selectedImage = [[UIImage imageNamed:itemHighlightedIcons[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        CGFloat imageOffset = (kScreenHeight >= 812) ? 3.f : 2.f;
        vc.tabBarItem.imageInsets = UIEdgeInsetsMake(imageOffset, 0, -imageOffset, 0);
        CGFloat titleOffset = (kScreenHeight >= 812) ? -2.f : 2.f;
        vc.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -titleOffset);
        WYBaseNavigationController *navVC = [[WYBaseNavigationController alloc] initWithRootViewController:vc];
        [mutableNavArr addObject:navVC];
    }
    
    self.viewControllers = [mutableNavArr mutableCopy];
}

@end
