//
//  WYScanViewController.m
//  WYIOSProject
//
//  Created by wangyuan on 2018/7/30.
//  Copyright © 2018年 wangyuan. All rights reserved.
//

#import "WYScanViewController.h"

@interface WYScanViewController ()

@end

@implementation WYScanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cameraInvokeMsg = @"相机启动中";
    self.style = [self ZhiFuBaoStyle];
    self.isOpenInterestRect = YES;
    self.libraryType = SLT_ZXing;
    self.scanCodeType = SCT_BarCode128;
}

- (void)scanResultWithArray:(NSArray<LBXScanResult*>*)array
{
    if (!array ||  array.count < 1)
    {
        [self popAlertMsgWithScanResult:nil];
        
        return;
    }
    
    LBXScanResult *scanResult = array[0];
    
    NSString*strResult = scanResult.strScanned;
    
//    self.scanImage = scanResult.imgScanned;
    
    if (!strResult) {
        
        [self popAlertMsgWithScanResult:nil];
        
        return;
    }
    
   
    //TODO: 这里可以根据需要自行添加震动或播放声音提示相关代码
    //...
    
    [self showNextVCWithScanResult:scanResult];
}

- (void)popAlertMsgWithScanResult:(NSString*)strResult
{
    if (!strResult) {
        
        strResult = @"识别失败";
    }
    
//    __weak __typeof(self) weakSelf = self;
//    [LBXAlertAction showAlertWithTitle:@"扫码内容" msg:strResult buttonsStatement:@[@"知道了"] chooseBlock:^(NSInteger buttonIdx) {
//
//        [weakSelf reStartDevice];
//    }];
}

- (void)showNextVCWithScanResult:(LBXScanResult*)strResult
{
//    ScanResultViewController *vc = [ScanResultViewController new];
//    vc.imgScan = strResult.imgScanned;
//    
//    vc.strScan = strResult.strScanned;
//    
//    vc.strCodeType = strResult.strBarCodeType;
//    
//    [self.navigationController pushViewController:vc animated:YES];
}


- (LBXScanViewStyle*)ZhiFuBaoStyle
{
    //设置扫码区域参数
    LBXScanViewStyle *style = [[LBXScanViewStyle alloc]init];
    style.centerUpOffset = 60;
    style.xScanRetangleOffset = 30;
    
    if ([UIScreen mainScreen].bounds.size.height <= 480 )
    {
        //3.5inch 显示的扫码缩小
        style.centerUpOffset = 40;
        style.xScanRetangleOffset = 20;
    }
    
    style.photoframeAngleStyle = LBXScanViewPhotoframeAngleStyle_Inner;
    style.photoframeLineW = 2.0;
    style.photoframeAngleW = 16;
    style.photoframeAngleH = 16;
    
    style.colorAngle = RGB(67, 255, 176);
    
    style.isNeedShowRetangle = NO;
    style.anmiationStyle = LBXScanViewAnimationStyle_NetGrid;
    
    style.notRecoginitonArea = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    
    
    //使用的支付宝里面网格图片
    UIImage *imgFullNet = [UIImage imageNamed:@"qrcode_scan_full_net"];
    style.animationImage = imgFullNet;
    
    return style;
}


@end
