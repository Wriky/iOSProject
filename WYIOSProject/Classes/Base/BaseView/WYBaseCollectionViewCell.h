//
//  WYBaseCollectionViewCell.h
//  WYIOSProject
//
//  Created by wangyuan on 2018/1/11.
//  Copyright © 2018年 wangyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>
#import "UIFont+Additions.h"
#import "WYColorConfiguration.h"

@interface WYBaseCollectionViewCell : UICollectionViewCell

- (void)updateCellDataWithParam:(id)param;

@end
