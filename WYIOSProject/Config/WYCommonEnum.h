//
//  WYCommonEnum.h
//  WYIOSProject
//
//  Created by wangyuan on 2018/5/30.
//  Copyright © 2018年 wangyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

//Cell的位置：第一行／最后一行
typedef NS_ENUM(NSInteger, TableCellType) {
    TableCellTypeTop = 1,
    TableCellTypeBottom,
    TableCellTypeMiddle
};

//获取验证码类型
typedef NS_ENUM(NSInteger, CaptchaType) {
    CaptchaTypeRegister = 1,
    CaptchaTypeForgetPwd,
    CaptchaTypeQuickLogin
};

//忘记密码／修改密码
typedef NS_ENUM(NSInteger, FixPassWordType) {
    FixPassWordTypeForget = 1,
    FixPassWordTypeChange
};

// 消息发送状态
typedef enum {
    MessageDeliveryState_Pending = 0,  // 待发送
    MessageDeliveryState_Delivering,   // 正在发送
    MessageDeliveryState_Delivered,    // 已发送，成功
    MessageDeliveryState_Failure,      // 发送失败
}MessageDeliveryState;


// 消息类型
typedef enum {
    MessageType_Text  = 1,             // 文本
    MessageType_Voice,                 // 短录音
    MessageType_Image,                 // 图片
    MessageType_Video,                 // 短视频
    MessageType_Doc,                   // 文档
    MessageType_TextURL,               // 文本＋链接
    MessageType_ImageURL,              // 图片＋链接
    MessageType_URL,                   // 纯链接
    MessageType_DrtNews,               // 送达号
    MessageType_NTF   = 12,            // 通知
    
    MessageType_DTxt  = 21,            // 纯文本
    MessageType_DPic  = 22,            // 文本＋单图
    MessageType_DMPic = 23,            // 文本＋多图
    MessageType_DVideo= 24,            // 文本＋视频
    MessageType_PicURL= 25             // 动态图文链接
    
}MessageType;

// 消息状态
typedef enum {
    MessageStatus_unRead = 0,          // 消息未读
    MessageStatus_read,                // 消息已读
    MessageStatus_back                 // 消息撤回
}MessageStatus;

typedef enum {
    ChatToolBarStatusNothing,     // 默认状态
    ChatToolBarStatusShowVoice,   // 录音状态
    ChatToolBarStatusShowFace,    // 输入表情状态
    ChatToolBarStatusShowMore,    // 显示“更多”页面状态
    ChatToolBarStatusShowKeyboard,// 正常键盘
    ChatToolBarStatusShowVideo    // 录制视频
}ChatToolBarStatus;
