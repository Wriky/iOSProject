//
//  WYChatFaceView.m
//  WYIOSProject
//
//  Created by wangyuan on 2018/6/4.
//  Copyright © 2018年 wangyuan. All rights reserved.
//

#import "WYChatFaceView.h"
#import "WYEmotionCollectionView.h"
#import "WYChatViewModel.h"

@interface WYChatFaceView()

@property (nonatomic, strong) WYEmotionCollectionView *emotionView;
@property (nonatomic, strong) NSArray *emotionArray;

@end

@implementation WYChatFaceView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor yellowColor];
        self.emotionArray = [WYChatViewModel customEmotion];
        
        [self configUI];
    }
    return self;
}

- (void)configUI {
    [self addSubview:self.emotionView];
    
    WS(ws);
    [self.emotionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws);
    }];
    
    
}


- (WYEmotionCollectionView *)emotionView {
    if (!_emotionView) {
        _emotionView = [WYEmotionCollectionView new];
        _emotionView.emotionArray = self.emotionArray;
    }
    return _emotionView;
}
@end
