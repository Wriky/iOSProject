//
//  WYScanPermission.h
//  WYIOSProject
//
//  Created by wangyuan on 2018/8/3.
//  Copyright © 2018年 wangyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>


typedef NS_ENUM(NSInteger, WYPermissionType)
{
    WYPermissionType_Camera,
    WYPermissionType_Photos,
    
};

@interface WYScanPermission : NSObject

+ (AVAuthorizationStatus)authorizationStatus;

+ (void)authorizeWithType:(WYPermissionType)type Completion:(void(^)(BOOL granted ,BOOL firstTime ))completion;

@end
