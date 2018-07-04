//
//  WYChatToolBar.m
//  WYIOSProject
//
//  Created by wangyuan on 2018/5/31.
//  Copyright © 2018年 wangyuan. All rights reserved.
//

#import "WYChatToolBar.h"
#import "WYTextField.h"
#import "UIImage+Additions.h"

@interface WYChatToolBar()<UITextViewDelegate>

@property (nonatomic, strong) UIView *topLine;

@property (nonatomic, strong) UIButton *voiceButton;
@property (nonatomic, strong) UIButton *faceButton;
@property (nonatomic, strong) UIButton *moreButton;
@property (nonatomic, strong) UIButton *talkButton;

@property (nonatomic, strong) UITextView *textView;


@end


@implementation WYChatToolBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configUI];
    }
    return self;
}

- (void)configUI {
    [self addSubview:self.topLine];
    [self addSubview:self.voiceButton];
    [self addSubview:self.faceButton];
    [self addSubview:self.moreButton];
    [self addSubview:self.talkButton];
    [self addSubview:self.textView];
    
    self.status = ChatToolBarStatusNothing;
    
    [self makeConstraints];
}

- (void)makeConstraints {
    WS(ws);
    [self.topLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(ws);
        make.height.mas_equalTo(@(0.5f));
    }];
    [self.voiceButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(@6.f);
        make.left.equalTo(ws);
        make.width.height.mas_equalTo(@37.f);
    }];
    [self.moreButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(@6.f);
        make.right.equalTo(ws);
        make.width.height.mas_equalTo(@37.f);
    }];
    [self.faceButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(@6.f);
        make.right.equalTo(ws.moreButton.mas_left).offset(-4.f);
        make.width.height.mas_equalTo(@37.f);
    }];
    [self.talkButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.voiceButton.mas_right).offset(4.f);
        make.top.mas_equalTo(@(kTabBarHeight * 0.13));
        make.width.mas_equalTo(@(kScreenWidth-41*3));
        make.height.mas_equalTo(@37.f);
    }];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws.talkButton);
    }];
}


#pragma mark - Getter and Setter

- (UIView *) topLine
{
    if (_topLine == nil) {
        _topLine = [[UIView alloc] init];
        [_topLine setBackgroundColor:RGB(165, 165, 165)];
    }
    return _topLine;
}

- (UIButton *) voiceButton
{
    if (_voiceButton == nil) {
        _voiceButton = [[UIButton alloc] init];
        [_voiceButton setImage:[UIImage imageNamed:@"ToolViewInputVoice"] forState:UIControlStateNormal];
        [_voiceButton setImage:[UIImage imageNamed:@"ToolViewInputVoiceHL"] forState:UIControlStateHighlighted];
        [_voiceButton addTarget:self action:@selector(voiceButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _voiceButton;
}

- (UIButton *) moreButton
{
    if (_moreButton == nil) {
        _moreButton = [[UIButton alloc] init];
        [_moreButton setImage:[UIImage imageNamed:@"TypeSelectorBtn_Black"] forState:UIControlStateNormal];
        [_moreButton setImage:[UIImage imageNamed:@"TypeSelectorBtnHL_Black"] forState:UIControlStateHighlighted];
        [_moreButton addTarget:self action:@selector(moreButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _moreButton;
}

- (UIButton *) faceButton
{
    if (_faceButton == nil) {
        _faceButton = [[UIButton alloc] init];
        [_faceButton setImage:[UIImage imageNamed:@"ToolViewEmotion"] forState:UIControlStateNormal];
        [_faceButton setImage:[UIImage imageNamed:@"ToolViewEmotionHL"] forState:UIControlStateHighlighted];
        [_faceButton addTarget:self action:@selector(faceButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _faceButton;
}

- (UITextView *) textView
{
    if (_textView == nil) {
        _textView = [[UITextView alloc] init];
        [_textView setFont:[UIFont systemFontOfSize:16.0f]];
        [_textView.layer setMasksToBounds:YES];
        [_textView.layer setCornerRadius:4.0f];
        [_textView.layer setBorderWidth:0.5f];
        [_textView.layer setBorderColor:self.topLine.backgroundColor.CGColor];
        [_textView setScrollsToTop:NO];
        [_textView setReturnKeyType:UIReturnKeySend];
        [_textView setDelegate:self];
    }
    return _textView;
}

- (UIButton *) talkButton
{
    if (_talkButton == nil) {
        _talkButton = [[UIButton alloc] init];
        [_talkButton setTitle:@"按住 说话" forState:UIControlStateNormal];
        [_talkButton setTitle:@"松开 结束" forState:UIControlStateHighlighted];
        [_talkButton setTitleColor:[UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:1.0] forState:UIControlStateNormal];
        [_talkButton setBackgroundImage:[UIImage gxz_imageWithColor:[UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:0.5]] forState:UIControlStateHighlighted];
        [_talkButton.titleLabel setFont:[UIFont boldSystemFontOfSize:16.0f]];
        [_talkButton.layer setMasksToBounds:YES];
        [_talkButton.layer setCornerRadius:4.0f];
        [_talkButton.layer setBorderWidth:0.5f];
        [_talkButton.layer setBorderColor:self.topLine.backgroundColor.CGColor];
        [_talkButton setHidden:YES];
        [_talkButton addTarget:self action:@selector(talkButtonClick:) forControlEvents:UIControlEventTouchDown];
        [_talkButton addTarget:self action:@selector(talkButtonUpInside:) forControlEvents:UIControlEventTouchUpInside];
        [_talkButton addTarget:self action:@selector(talkButtonUpOutside:) forControlEvents:UIControlEventTouchUpOutside];
        [_talkButton addTarget:self action:@selector(talkButtonTouchCancel:) forControlEvents:UIControlEventTouchCancel];
        [_talkButton addTarget:self action:@selector(talkButtonDragOutside:) forControlEvents:UIControlEventTouchDragOutside];
        [_talkButton addTarget:self action:@selector(talkButtonDragInside:) forControlEvents:UIControlEventTouchDragInside];
    }
    return _talkButton;
}



#pragma mark- Action

- (void)voiceButtonClick:(UIButton *)button {
    ChatToolBarStatus lastStatus = self.status;
    if (lastStatus == ChatToolBarStatusShowVoice) {//正在显示talkButton，改为键盘状态
        self.status = ChatToolBarStatusShowKeyboard;
        [self.talkButton setHidden:YES];
        [self.textView setHidden:NO];
        [self.textView becomeFirstResponder];
        [self.voiceButton setImage:[UIImage imageNamed:@"ToolViewInputVoice"] forState:UIControlStateNormal];
    } else {    // 变成talkButton的状态
        [self.textView resignFirstResponder];
        [self.textView setHidden:YES];
        [self.talkButton setHidden:NO];
        [self.voiceButton setImage:[UIImage imageNamed:@"ToolViewKeyboard"] forState:UIControlStateNormal];
        self.status = ChatToolBarStatusShowVoice;
    }
    
    //声音和键盘切换操作
    if (self.delegate && [self.delegate respondsToSelector:@selector(chatToolBar:ChangeStatusFrom:To:)]) {
        [self.delegate chatToolBar:self ChangeStatusFrom:lastStatus To:self.status];
    }
}

- (void)moreButtonClick:(UIButton *)button {
    ChatToolBarStatus lastStatus = self.status;
    if (lastStatus == ChatToolBarStatusShowMore) { // 当前显示的就是more页面
        self.status = ChatToolBarStatusShowKeyboard;
        [self.textView becomeFirstResponder];
    } else {
        [self.talkButton setHidden:YES];
        [self.textView setHidden:NO];
        [self.voiceButton setImage:[UIImage imageNamed:@"ToolViewInputVoice"] forState:UIControlStateNormal];
        
        self.status = ChatToolBarStatusShowMore;
        if (lastStatus == ChatToolBarStatusShowFace) {  // 改变按钮样式
            [self.faceButton setImage:[UIImage imageNamed:@"ToolViewEmotion"] forState:UIControlStateNormal];
        } else if (lastStatus == ChatToolBarStatusShowVoice) {
            [self.talkButton setHidden:YES];
            [self.textView setHidden:NO];
            [self.voiceButton setImage:[UIImage imageNamed:@"ToolViewInputVoice"] forState:UIControlStateNormal];
        } else if (lastStatus == ChatToolBarStatusShowKeyboard) {
            [self.textView resignFirstResponder];
            self.status = ChatToolBarStatusShowMore;
        }
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(chatToolBar:ChangeStatusFrom:To:)]) {
        [self.delegate chatToolBar:self ChangeStatusFrom:lastStatus To:self.status];
    }
}

- (void)faceButtonClick:(UIButton *)button {
    ChatToolBarStatus lastStatus = self.status;
    if (lastStatus == ChatToolBarStatusShowFace) {       // 正在显示表情,改为现实键盘状态
        self.status = ChatToolBarStatusShowKeyboard;
        [self.faceButton setImage:[UIImage imageNamed:@"ToolViewEmotion"] forState:UIControlStateNormal];
        [self.textView becomeFirstResponder];
    } else {
        [self.talkButton setHidden:YES];
        [self.textView setHidden:NO];
        [self.voiceButton setImage:[UIImage imageNamed:@"ToolViewInputVoice"] forState:UIControlStateNormal];
        self.status = ChatToolBarStatusShowFace;
        [self.faceButton setImage:[UIImage imageNamed:@"ToolViewKeyboard"] forState:UIControlStateNormal];
        if (lastStatus == ChatToolBarStatusShowMore) {
        } else if (lastStatus == ChatToolBarStatusShowVoice) {
            [self.voiceButton setImage:[UIImage imageNamed:@"ToolViewInputVoice"] forState:UIControlStateNormal];
            [self.talkButton setHidden:YES];
            [self.textView setHidden:NO];
        }  else if (lastStatus == ChatToolBarStatusShowKeyboard) {
            [self.textView resignFirstResponder];
            self.status = ChatToolBarStatusShowFace;
        } else if (lastStatus == ChatToolBarStatusShowVoice) {
            [self.talkButton setHidden:YES];
            [self.textView setHidden:NO];
            [self.voiceButton setImage:[UIImage imageNamed:@"ToolViewInputVoice"] forState:UIControlStateNormal];
            self.status = ChatToolBarStatusShowFace;
        }
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(chatToolBar:ChangeStatusFrom:To:)]) {
        [self.delegate chatToolBar:self ChangeStatusFrom:lastStatus To:self.status];
    }
}

- (void)talkButtonClick:(UIButton *)button {
    
}

- (void)talkButtonUpInside:(UIButton *)button
{
   
}

- (void)talkButtonUpOutside:(UIButton *)button
{
    
}

- (void)talkButtonDragOutside:(UIButton *)button
{
    
}

- (void)talkButtonDragInside:(UIButton *)button
{
   
}

- (void)talkButtonTouchCancel:(UIButton *)button
{
}

#pragma mark - UITextViewDelegate
- (void)textViewDidBeginEditing:(UITextView *)textView {
    self.status = ChatToolBarStatusShowKeyboard;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text isEqualToString:@"\n"]) {
        //发送消息
        if (self.delegate && [self.delegate respondsToSelector:@selector(chatToolBar:SendTextMessage:)]) {
            [self.delegate chatToolBar:self SendTextMessage:textView.text];
        }
        return  NO;
    }
    return YES;
}

- (BOOL)resignFirstResponder {
    [self.textView resignFirstResponder];
    [self.moreButton setImage:[UIImage imageNamed:@"TypeSelectorBtn_Black"] forState:UIControlStateNormal];
    [self.faceButton setImage:[UIImage imageNamed:@"ToolViewEmotion"] forState:UIControlStateNormal];
    return [super resignFirstResponder];
}

@end
