//
//  WYThirdPartConfig.h
//  WYIOSProject
//
//  Created by wangyuan on 2018/5/25.
//  Copyright © 2018年 wangyuan. All rights reserved.
//

#ifndef WYThirdPartConfig_h
#define WYThirdPartConfig_h

//微信授权登录
static NSString *kAuthScope = @"snsapi_message,snsapi_userinfo,snsapi_friend,snsapi_contact";
static NSString *kAuthState = @"xxx";

//WEIXIN appid
static NSString * const kWXAppID = @"wxc38db87dcff6bde6";
static NSString * const kWXAppSecret = @"be8ed21fce54eb51f2fa1d35705e15b3";
static NSString *kLinkTagName = @"WECHAT_TAG_JUMP_SHOWRANK";

//微博
static NSString * const kWeboAppKey = @"2970713056";
static NSString * const kWeboAppSecret = @"137472a9f311d78bf05906909a699b81";
static NSString * const kWeiboRedirectURI = @"https://www.sina.com";

//ali
//debug
//static NSString * const kAliPushAppKey = @"24796206";
//static NSString * const kAliPushAppSecret = @"ae933558a020cdcab92d8ec29b3414f7";
//prod
static NSString * const kAliPushAppKey = @"24830354";
static NSString * const kAliPushAppSecret = @"89fb2c90551b09548cf3d8fecfb42275";


#endif /* ThirdPartConfig_h */
