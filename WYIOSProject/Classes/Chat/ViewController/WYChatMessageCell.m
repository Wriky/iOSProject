//
//  WYChatMessageCell.m
//  WYIOSProject
//
//  Created by wangyuan on 2018/5/30.
//  Copyright © 2018年 wangyuan. All rights reserved.
//

#import "WYChatMessageCell.h"

@interface WYChatMessageCell ()

@property (nonatomic, strong) UIImageView *avatarImgView;
@property (nonatomic, strong) UIImageView *bubbleView;
@property (nonatomic, strong) UILabel *txtLabel;
@property (nonatomic, strong) UIActivityIndicatorView *activityView;
@property (nonatomic, strong) UIButton *retryButton;

@end

@implementation WYChatMessageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.contentView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [self configUI];
    }
    return self;
}

- (void)configUI {
    [self.contentView addSubview:self.avatarImgView];
    [self.contentView addSubview:self.bubbleView];
    [self.contentView addSubview:self.txtLabel];
    [self.contentView addSubview:self.activityView];
    [self.contentView addSubview:self.retryButton];
    
    WS(ws);
    [self.avatarImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(@(-20.f));
        make.top.mas_equalTo(@15.f);
        make.width.height.mas_equalTo(@40.f);
    }];
    [self.bubbleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws.avatarImgView.mas_left).offset(-5.f);
        make.top.equalTo(ws.avatarImgView);
        make.width.lessThanOrEqualTo(@230);
        make.bottom.mas_equalTo(@(-15.f));
    }];
    [self.txtLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.bubbleView).offset(12.f);
        make.top.equalTo(ws.bubbleView).offset(10.f);
        make.right.equalTo(ws.bubbleView).offset(-18.f);
        make.bottom.equalTo(ws.bubbleView).offset(-10.f);
    }];
   
    [self.activityView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws.bubbleView.mas_left).offset(-2.f);
        make.centerY.equalTo(ws.bubbleView.mas_centerY);
    }];
    [self.retryButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws.bubbleView.mas_left).offset(-3.f);
        make.centerY.equalTo(ws.bubbleView.mas_centerY);
    }];
}

- (UIImageView *)avatarImgView {
    if (!_avatarImgView) {
        _avatarImgView = [UIImageView new];
        _avatarImgView.layer.cornerRadius = 20.f;
        _avatarImgView.clipsToBounds = YES;
        _avatarImgView.backgroundColor = [UIColor lightGrayColor];
    }
    return _avatarImgView;
}

- (UIImageView *)bubbleView {
    if (!_bubbleView) {
        _bubbleView = [UIImageView new];
        UIImage * tempImage = [UIImage imageNamed:@"chat_bg_right"];
        tempImage = [tempImage resizableImageWithCapInsets:UIEdgeInsetsMake(30, 20, 10, 30) resizingMode:UIImageResizingModeStretch];
        _bubbleView.image = tempImage;
    }
    return _bubbleView;
}

- (UILabel *)txtLabel {
    if (!_txtLabel) {
        _txtLabel = [UILabel new];
        _txtLabel.font = [UIFont systemFontOfSize:12];
        _txtLabel.numberOfLines = 0;
        _txtLabel.preferredMaxLayoutWidth = 200.f;
        
    }
    return _txtLabel;
}

- (UIActivityIndicatorView *)activityView {
    if (_activityView == nil) {
        _activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        //_activityView.hidden = NO;
        //[_activityView startAnimating];
    }
    return _activityView;
}

- (UIButton *)retryButton {
    if (_retryButton == nil) {
        _retryButton = [[UIButton alloc] init];
        [_retryButton setImage:[UIImage imageNamed:@"button_retry_comment"] forState:UIControlStateNormal];
        [_retryButton addTarget:self action:@selector(retryButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        _retryButton.hidden = YES;
    }
    return _retryButton;
}


#pragma mark- data
- (void)updateCellDataWithParam:(id)param {
    self.txtLabel.text = param;
}



#pragma mark- Action
- (void)retryButtonClick:(UIButton *)button {
    
}


@end
