//
//  MyTableViewCell.m
//  CustomCell
//
//  Created by 许小六 on 2018/9/5.
//  Copyright © 2018年 许小六. All rights reserved.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

- (void)setModel:(MyTableViewCellModel *)model {
//    if (_model != model) {
        _model = model;
        _topTitelLabel.text = model.itemDic.allKeys[0];
        
        [_changeView removeFromSuperview];
        _changeView = [[ChangeView alloc] initWithFrame:CGRectMake(20, 40, self.contentView.frame.size.width - 40, 0)];
        [self.contentView addSubview:_changeView];
        //        //self.contentView.clipsToBounds = YES;
        //        self.clipsToBounds = YES;
        
        NSArray *items = model.itemDic.allValues[0];
        if (items.count > 4) {
            _optionBtn.hidden = NO;
            _optionBtn.selected = model.isShow;
            if (model.isShow) {
                model.currentHeight = [_changeView addWithItems:items Columns:4 BtnH:20 BtnLF:10 BtnTB:10];
                
            } else {
                model.currentHeight = [_changeView addWithItems:[items subarrayWithRange:NSMakeRange(0, 4)] Columns:4 BtnH:20 BtnLF:10 BtnTB:10];
            }
            
        } else {
            _optionBtn.hidden = YES;
            model.currentHeight = [_changeView addWithItems:items Columns:4 BtnH:20 BtnLF:10 BtnTB:10];
        }
//    }
}

- (IBAction)click:(id)sender {
    if (self.changeBlock) {
        self.model.isShow = !self.model.isShow;
        self.changeBlock(self.indexPath);
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
