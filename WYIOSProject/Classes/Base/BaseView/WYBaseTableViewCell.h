//
//  WYBaseTableViewCell.h
//  WYIOSProject
//
//  Created by wangyuan on 2018/1/11.
//  Copyright © 2018年 wangyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>
#import "UIFont+Additions.h"
#import "WYCommonEnum.h"
#import "WYColorConfiguration.h"
#import "UIImageView+WebCache.h"


@interface WYBaseTableViewCell : UITableViewCell

- (void)updateCellDataWithParam:(id)param;

@property (nonatomic, assign) TableCellType cellType;


@end
