//
//  WYChatViewController.m
// WYIOSProject
//
//  Created by wangyuan on 2018/5/24.
//  Copyright © 2018年 wangyuan. All rights reserved.
//

#import "WYChatViewController.h"
#import "WYChatMessageCell.h"
#import "WYChatToolBarViewController.h"
#import "WYMessage.h"
#import "WYChatViewModel.h"


static NSString * const kChatTextCell = @"WYChatTextCell";

@interface WYChatViewController ()<UITableViewDelegate, UITableViewDataSource, WYChatToolBarViewControllerDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) WYChatToolBarViewController *chatToolBarVC;

@property (nonatomic, assign) BOOL isKeyBoardAppear;

@end

@implementation WYChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"乔布斯";
    self.view.backgroundColor = [UIColor whiteColor];

    [self showNavigationBarBackButton];
    NSArray *array = @[@"天将降大任于斯人也，必将苦其心志，劳其筋骨，空乏其身，天将降大任于斯人也，必将苦其心志，劳其筋骨，空乏其身天将降大任于斯人也，必将苦其心志，劳其筋骨，空乏其身", @"哈哈", @"你在说什么呢",@"123514345345151534535151"];
    self.dataArray = [array mutableCopy];
    [self configUI];
}

- (void)configUI {
    
    [self.view addSubview:self.tableView];

    [self addChildViewController:self.chatToolBarVC];
    [self.view addSubview:self.chatToolBarVC.view];
    
    
    WS(ws);
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(ws.view);
        make.height.mas_equalTo(@(kScreenHeight-kTabBarHeight));
    }];
    [self.chatToolBarVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(ws.view);
        make.height.mas_equalTo(@(kTabBarHeight));
    }];
}


#pragma mark- setter & getter

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [UITableView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = 60;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_tableView registerClass:[WYChatMessageCell class] forCellReuseIdentifier:kChatTextCell];
        
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapTableView:)];
        [_tableView addGestureRecognizer:singleTap];
    }
    return _tableView;
}

- (WYChatToolBarViewController *)chatToolBarVC {
    if (!_chatToolBarVC) {
        _chatToolBarVC = [WYChatToolBarViewController new];
        _chatToolBarVC.chatDelegate = self;
    }
    return _chatToolBarVC;
}

- (NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}


#pragma mark- UITableViewDelegate, UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WYChatMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:kChatTextCell];
    [cell updateCellDataWithParam:self.dataArray[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}


#pragma mark- WYChatToolBarViewControllerDelegate

- (void)didChangeChatToolBarHeight:(CGFloat)height {
    
    [self.chatToolBarVC.view mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(@(-height+kTabBarHeight));
    }];
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@(kScreenHeight-height-kNormalNavBarHeight));
    }];
    
    if (height == kTabBarHeight) {
        [self.tableView reloadData];
        self.isKeyBoardAppear = NO;
    } else {
        [self scrollToBottom];
        self.isKeyBoardAppear = YES;
    }
}

- (void)sendTextMessage:(NSString *)textStr {
    if (textStr && textStr.length>0) {
        [self sendTextMessageWithContent:textStr];
    }
}

- (void)sendImageMessage:(UIImage *)image imagePath:(NSString *)imagePath {
    
}

- (void)sendVoiceMessage:(NSString *)voicePath {
    
}


#pragma mark- private

- (void)scrollToBottom {
    if (self.dataArray.count > 0) {
        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:self.dataArray.count-1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    }
}

- (void)tapTableView:(UITapGestureRecognizer *)gesture {
    [self.chatToolBarVC.view endEditing:YES];
    
    [self didChangeChatToolBarHeight:kTabBarHeight];
}

- (void)sendTextMessageWithContent:(NSString *)messageStr {
//    WYMessage *message = [WYChatViewModel createMessage:TypeText Content:messageStr Path:nil From:@"WY" To:@"QBX" FileKey:nil IsSender:YES];
//    [self addObject:message IsSender:YES];
    
    [self addObject:messageStr IsSender:YES];
}

//- (void)addObject:(WYMessage *)message IsSender:(BOOL)isSender{
//    [self.dataArray addObject:message];
//    [self.tableView reloadData];
//}

- (void)addObject:(NSString *)message IsSender:(BOOL)isSender{
    [self.dataArray addObject:message];
    [self.tableView reloadData];
    [self scrollToBottom];
}

@end
