//
//  WYScanPermission.m
//  WYIOSProject
//
//  Created by wangyuan on 2018/8/3.
//  Copyright © 2018年 wangyuan. All rights reserved.
//

#import "WYScanPermission.h"
#import <Photos/Photos.h>

@implementation WYScanPermission

+ (BOOL)authorized {
    if ([AVCaptureDevice respondsToSelector:@selector(authorizationStatusForMediaType:)])
    {
        AVAuthorizationStatus permission =
        [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        
        return permission == AVAuthorizationStatusAuthorized;
        
    } else {
        // Prior to iOS 8 all apps were authorized.
        return YES;
    }
}

+ (AVAuthorizationStatus)authorizationStatus
{
    if ([AVCaptureDevice respondsToSelector:@selector(authorizationStatusForMediaType:)])
    {
        return [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    } else {
        // Prior to iOS 8 all apps were authorized.
        return AVAuthorizationStatusAuthorized;
    }
}


+ (BOOL)authorizedWithType:(WYPermissionType)type
{
    switch (type) {
        case WYPermissionType_Camera:
            return [WYScanPermission authorizedCamera];
            break;
        case WYPermissionType_Photos:
            return [WYScanPermission authorized];
            break;
            
        default:
            break;
    }
    return NO;
}

+ (void)authorizeWithType:(WYPermissionType)type Completion:(void (^)(BOOL, BOOL))completion {
    switch (type) {
        case WYPermissionType_Camera:
            return [WYScanPermission authorizeCameraWithCompletion:completion];
            break;
        case WYPermissionType_Photos:
            return [WYScanPermission authorizePhotosWithCompletion:completion];
            break;
        default:
            break;
    }
}

+ (BOOL)authorizedCamera
{
    if ([AVCaptureDevice respondsToSelector:@selector(authorizationStatusForMediaType:)])
    {
        AVAuthorizationStatus permission =
        [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        
        return permission == AVAuthorizationStatusAuthorized;
        
    } else {
        // Prior to iOS 8 all apps were authorized.
        return YES;
    }
}

+ (BOOL)authorizedPhotos {
    return [PHPhotoLibrary authorizationStatus] == PHAuthorizationStatusAuthorized;
}

+ (void)authorizeCameraWithCompletion:(void(^)(BOOL granted,BOOL firstTime))completion
{
    if ([AVCaptureDevice respondsToSelector:@selector(authorizationStatusForMediaType:)]) {
        AVAuthorizationStatus permission =
        [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        
        switch (permission) {
            case AVAuthorizationStatusAuthorized:
                completion(YES,NO);
                break;
            case AVAuthorizationStatusDenied:
            case AVAuthorizationStatusRestricted:
                completion(NO,NO);
                break;
            case AVAuthorizationStatusNotDetermined:
            {
                [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo
                                         completionHandler:^(BOOL granted) {
                                             if (completion) {
                                                 dispatch_async(dispatch_get_main_queue(), ^{
                                                     completion(granted,YES);
                                                 });
                                             }
                                         }];
                
            }
                break;
        }
    } else {
        // Prior to iOS 8 all apps were authorized.
        completion(YES,NO);
    }
}


+ (void)authorizePhotosWithCompletion:(void(^)(BOOL granted,BOOL firstTime))completion
{
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    
    switch (status) {
        case PHAuthorizationStatusAuthorized:
        {
            if (completion) {
                completion(YES,NO);
            }
        }
            break;
        case PHAuthorizationStatusRestricted:
        case PHAuthorizationStatusDenied:
        {
            if (completion) {
                completion(NO,NO);
            }
        }
            break;
        case PHAuthorizationStatusNotDetermined:
        {
            [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
                if (completion) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        completion(status == PHAuthorizationStatusAuthorized,YES);
                    });
                }
            }];
        }
            break;
        default:
        {
            if (completion) {
                completion(NO,NO);
            }
        }
            break;
    }
}
@end
