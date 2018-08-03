//
//  WYBaseNavigationController.m
//  WYIOSProject
//
//  Created by wangyuan on 2018/1/22.
//  Copyright © 2018年 wangyuan. All rights reserved.
//

#import "WYBaseNavigationController.h"

@interface WYBaseNavigationController ()<UINavigationControllerDelegate,UIGestureRecognizerDelegate>

@end

static NSArray *disableSwipeBackContoller = nil;
static NSArray *hiddenNavBarClassArray = nil;


@implementation WYBaseNavigationController

+ (void)initialize {
    disableSwipeBackContoller = @[
                                  ];
    hiddenNavBarClassArray = @[
                               NSClassFromString(@"WYScanReaderViewController")
                               ];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    self.interactivePopGestureRecognizer.delegate = self;

    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(-200, 0) forBarMetrics:UIBarMetricsDefault];
    UIImage *backButtonImage = [[UIImage imageNamed:@"nav_gray_back_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [UINavigationBar appearance].backIndicatorImage = backButtonImage;

    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"11.0")) {
        [UINavigationBar appearance].backIndicatorTransitionMaskImage =backButtonImage;
    } else {
        [[UIBarButtonItem appearance] setBackButtonBackgroundImage:[backButtonImage resizableImageWithCapInsets:UIEdgeInsetsMake(0, backButtonImage.size.width, 0, 0)] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    }
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (animated) {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    [super pushViewController:viewController animated:animated];
}

- (NSArray<UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated {
    if (animated) {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    return [super popToRootViewControllerAnimated:animated];
}

- (NSArray<UIViewController *> *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (animated) {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    return  [super popToViewController:viewController animated:false];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    
    return [super popViewControllerAnimated:animated];
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    Class vcClass = [viewController class];
    
    if ([hiddenNavBarClassArray containsObject:vcClass]) {
        [navigationController setNavigationBarHidden:YES animated:animated];
    } else {
        [navigationController setNavigationBarHidden:NO animated:animated];
    }
    
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    self.interactivePopGestureRecognizer.enabled = YES;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    Class vcClass = [self.viewControllers.lastObject class];
    
    if ([disableSwipeBackContoller containsObject:vcClass]) {
        return NO;
    }
    
    if (gestureRecognizer == self.interactivePopGestureRecognizer) {
        if (self.viewControllers.count < 2 || self.visibleViewController == self.viewControllers[0] ){
            return NO;
        }
    }

    return YES;
}


@end
