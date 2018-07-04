//
//  WYChatViewModel.m
//  WYIOSProject
//
//  Created by wangyuan on 2018/5/31.
//  Copyright © 2018年 wangyuan. All rights reserved.
//

#import "WYChatViewModel.h"
#import "WYEmotion.h"
#import "MJExtension.h"

@implementation WYChatViewModel

+ (WYMessage *)createMessage:(NSString *)type
                     Content:(NSString *)contentStr
                        Path:(NSString *)path
                        From:(NSString *)from
                          To:(NSString *)to
                     FileKey:(NSString *)fileKey
                    IsSender:(BOOL)isSender {
    WYMessage *message = [[WYMessage alloc] init];
    message.type = type;
    message.mediaPath = path;
    message.from = from;
    message.to = to;
    message.fileKey = fileKey;
    message.isSender = isSender;
    message.date = [WYToolKit currentMessageTime];
    
    if ([type isEqualToString:TypeText] || [type isEqualToString:TypeSystem]) {
        message.content = contentStr;
    } else if ([type isEqualToString:TypePic]) {
        message.content = @"[图片]";
    } else if ([type isEqualToString:TypeVoice]) {
        message.content = @"[语音]";
    } else if ([type isEqualToString:TypeVideo]) {
        message.content = @"[视频]";
    } else if ([type isEqualToString:TypeFile]) {
        message.content = @"[文件]";
    }
    
    if (isSender) {
        message.status = MessageDeliveryState_Delivering;
    } else {
        message.status = MessageDeliveryState_Delivered;
    }
    return message;
}

+ (NSArray *)emojiEmotion {
    NSArray *emojiArr = [NSArray new];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"emoji.plist" ofType:nil];
    emojiArr = [WYEmotion mj_objectArrayWithKeyValuesArray:[NSArray arrayWithContentsOfFile:path]];
    
    return emojiArr;
}

+ (NSArray *)customEmotion {
    NSArray *customArr = [NSArray new];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"normal_face.plist" ofType:nil];
    customArr = [WYEmotion mj_objectArrayWithKeyValuesArray:[NSArray arrayWithContentsOfFile:path]];
    return customArr;
}

@end
