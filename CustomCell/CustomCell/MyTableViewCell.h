//
//  MyTableViewCell.h
//  CustomCell
//
//  Created by 许小六 on 2018/9/5.
//  Copyright © 2018年 许小六. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTableViewCellModel.h"
#import "ChangeView.h"

typedef void(^CHANGEBLOCK)(NSIndexPath *indexPath);

@interface MyTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *topTitelLabel;
@property (weak, nonatomic) IBOutlet UIButton *optionBtn;
@property (nonatomic, strong) ChangeView *changeView;
@property (nonatomic, strong) MyTableViewCellModel *model;
@property (nonatomic, assign) NSIndexPath *indexPath;
@property (nonatomic, copy) CHANGEBLOCK changeBlock;

@end
