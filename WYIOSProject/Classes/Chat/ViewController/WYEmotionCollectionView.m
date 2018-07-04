//
//  WYEmotionCollectionView.m
//  WYIOSProject
//
//  Created by wangyuan on 2018/6/4.
//  Copyright © 2018年 wangyuan. All rights reserved.
//

#import "WYEmotionCollectionView.h"
#import "WYEmotion.h"

static NSString * const kCollectionIdentifier = @"CollectionIdentifier";
@interface WYEmotionCollectionView()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation WYEmotionCollectionView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configUI];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)configUI {
    [self addSubview:self.collectionView];
    
    
//    WS(ws);
//    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(ws);
//    }];
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.itemSize = CGSizeMake(60, 60);
        layout.minimumLineSpacing = 10.f;
        layout.minimumInteritemSpacing = 10.f;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, kTabBarHeight, kScreenWidth, kChatBarHeight) collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kCollectionIdentifier];
        _collectionView.delegate = self;
    }
    return _collectionView;
}


#pragma mark- UICollectionViewDelegate, UICollectionViewDataSource

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCollectionIdentifier forIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor redColor];
    
    UIImageView *imgView = [cell.contentView viewWithTag:10086];
    if (imgView == nil) {
        imgView = [UIImageView new];
        imgView.frame = cell.bounds;
        imgView.tag = 10086;
        imgView.contentMode = UIViewContentModeScaleAspectFill;
        imgView.clipsToBounds = YES;
        imgView.backgroundColor = [UIColor lightGrayColor];
        [cell.contentView addSubview:imgView];
    }
    
    if (self.emotionArray.count > indexPath.row) {
        WYEmotion *emotion = self.emotionArray[indexPath.row];
        imgView.image = [UIImage imageNamed:emotion.face_name];
    }
    
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.emotionArray.count;
}




@end
