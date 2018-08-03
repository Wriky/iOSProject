//
//  WYScanReaderViewController.h
//  WYIOSProject
//
//  Created by wangyuan on 2018/7/30.
//  Copyright © 2018年 wangyuan. All rights reserved.
//

#import "LBXScanViewController.h"

@interface WYScanReaderViewController : LBXScanViewController

- (void)setCompletionWithBlock:(nullable void (^) (id __nullable resultParam))completionBlock;

@end
