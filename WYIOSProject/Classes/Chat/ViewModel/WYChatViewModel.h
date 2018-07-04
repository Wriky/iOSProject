//
//  WYChatViewModel.h
//  WYIOSProject
//
//  Created by wangyuan on 2018/5/31.
//  Copyright © 2018年 wangyuan. All rights reserved.
//

#import "WYBaseViewModel.h"
#import "WYMessage.h"

@interface WYChatViewModel : WYBaseViewModel

+ (WYMessage *)createMessage:(NSString *)type
                     Content:(NSString *)contentStr
                        Path:(NSString *)path
                        From:(NSString *)from
                          To:(NSString *)to
                     FileKey:(NSString *)fileKey
                    IsSender:(BOOL)isSender;


+ (NSArray *)emojiEmotion;

+ (NSArray *)customEmotion;

@end
