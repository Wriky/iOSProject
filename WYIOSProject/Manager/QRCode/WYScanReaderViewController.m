//
//  WYScanReaderViewController.m
//  WYIOSProject
//
//  Created by wangyuan on 2018/7/30.
//  Copyright © 2018年 wangyuan. All rights reserved.
//

#import "WYScanReaderViewController.h"
#import "WYAlertViewController.h"

static NSString *const kScanFailure = @"识别失败";

@interface WYScanReaderViewController ()

@property (copy, nonatomic) void (^completionBlock) (id __nullable);


@end

@implementation WYScanReaderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"扫一扫";

    self.cameraInvokeMsg = @"相机启动中";
    self.style = [self ZhiFuBaoStyle];
    self.isOpenInterestRect = YES;
    self.libraryType = SLT_ZXing;
    self.scanCodeType = SCT_QRCode;
    self.isNeedScanImage = NO;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self customNavigationBar];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}

#pragma mark- UI

- (void)customNavigationBar {
    UIButton *leftBtn = [UIButton buttonWithType:0];
    leftBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    leftBtn.frame = CGRectMake(20, 33, 20, 20);
    [leftBtn setImage:[UIImage imageNamed:@"nav_white_back_icon"] forState:UIControlStateNormal];
    leftBtn.adjustsImageWhenHighlighted = NO;
    [leftBtn addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:leftBtn];
    
    UILabel *titleLabel = [UILabel new];
    titleLabel.frame = CGRectMake(kScreenWidth/2-60, 28, 120, 30);
    titleLabel.font = [UIFont CFRegular:18.f];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.text = self.title;
    [self.view addSubview:titleLabel];
}

- (LBXScanViewStyle*)ZhiFuBaoStyle
{
    //设置扫码区域参数
    LBXScanViewStyle *style = [[LBXScanViewStyle alloc]init];
    style.centerUpOffset = 60;
    style.xScanRetangleOffset = kFit320Size(60);
    
    
    style.photoframeAngleStyle = LBXScanViewPhotoframeAngleStyle_Inner;
    style.photoframeLineW = 2.0;
    style.photoframeAngleW = 22;
    style.photoframeAngleH = 22;
    
    style.colorAngle = RGB(67, 255, 176);
    
    style.isNeedShowRetangle = NO;
    style.anmiationStyle = LBXScanViewAnimationStyle_NetGrid;
    
    style.notRecoginitonArea = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
    
    //使用的支付宝里面网格图片
    UIImage *imgFullNet = [UIImage imageNamed:@"qrcode_scan_full_net"];
    style.animationImage = imgFullNet;
    
    return style;
}


#pragma mark- Scan Delegate

- (void)scanResultWithArray:(NSArray<LBXScanResult*>*)array
{
    if (!array ||  array.count < 1)
    {
        [self showScanTipAlert:kScanFailure];
        
        return;
    }
    
    LBXScanResult *scanResult = array[0];
    
    NSString*strResult = scanResult.strScanned;
    
    if (!strResult) {
        
        [self showScanTipAlert:kScanFailure];
        
        return;
    }
    
    [self showNextVCWithScanResult:scanResult];
}


#pragma mark- Request


#pragma mark- Private

- (void)showScanTipAlert:(NSString *)tipString {
    if (!tipString || tipString.length < 1) {
        tipString = kScanFailure;
    }
    [WYAlertViewController getTipAlertControllerWithTitle:tipString message:nil cancelTitle:@"我知道了" viewController:self cancelBlock:^(UIAlertAction *action) {
        [self reStartDevice];
    }];
}

- (void)showNextVCWithScanResult:(LBXScanResult*)strResult
{
   // NSString *urlStr = [self handleResult:strResult];
    
   //todo
}


- (void)backAction:(UIButton *)button {
    [self.navigationController popViewControllerAnimated:YES];
}


- (NSString *)handleResult:(LBXScanResult*)strResult {
    NSURL *resultUrl = [NSURL URLWithString:strResult.strScanned];
    NSString *urlStr = @"";
    
    if (resultUrl.port > 0) {
        urlStr = [NSString stringWithFormat:@"%@://%@:%@",resultUrl.scheme,resultUrl.host, resultUrl.port];
    } else {
        urlStr = [NSString stringWithFormat:@"%@://%@",resultUrl.scheme,resultUrl.host];
    }
    return urlStr;
}


- (void)cancelQRCodeInterface {
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)setCompletionWithBlock:(void (^) (id resultParam))completionBlock
{
    self.completionBlock = completionBlock;
}


@end
