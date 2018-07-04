//
//  WYChatMoreView.m
//  WYIOSProject
//
//  Created by wangyuan on 2018/6/4.
//  Copyright © 2018年 wangyuan. All rights reserved.
//

#import "WYChatMoreView.h"

@interface WYChatMoreView()

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation WYChatMoreView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor purpleColor];
        [self configUI];
    }
    return self;
}

- (void)configUI {
    
   
}


@end
