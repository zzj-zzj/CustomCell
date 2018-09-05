//
//  ChangeView.m
//  CustomCell
//
//  Created by 许小六 on 2018/9/5.
//  Copyright © 2018年 许小六. All rights reserved.
//

#import "ChangeView.h"

@implementation ChangeView


/*!
 添加项
 
 @param items       项组
 @param columns     每行最多列数
 @param btnLF       左右间距
 @param btnTB       上下间距

 */
- (CGFloat)addWithItems:(NSArray *)items Columns:(int)columns BtnH:(CGFloat)btnH BtnLF:(CGFloat)btnLF BtnTB:(CGFloat)btnTB {
    // 按钮宽度
    CGFloat btnW = (self.frame.size.width - btnLF * (columns + 1)) / columns;
    
    for (int i = 0; i < items.count; i++) {
        // x规则
        CGFloat LF = (i % columns + 1) * btnLF + (i % columns) * btnW;
        // y规则
        CGFloat TB = (i / columns + 1) * btnTB + (i / columns) * btnH;
        
        UIButton *bt = [self CreateButton];
        bt.frame = CGRectMake(LF, TB, btnW, btnH);
        [bt setTitle:items[i] forState:UIControlStateNormal];
        [bt setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
//        bt.titleLabel.text = items[i];
//        bt.titleLabel.textColor = [UIColor orangeColor];
        [self addSubview:bt];
        
        if (i == items.count - 1) {
            CGRect newFrame = self.frame;
            newFrame.size.height = TB + btnH + btnTB;
            self.frame = newFrame;
        }
    }
    return self.frame.size.height + 50;
}


- (UIButton *)CreateButton {
    UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
    bt.titleLabel.font = [UIFont systemFontOfSize:15];
    bt.tintColor = [UIColor orangeColor];
    bt.layer.borderWidth = 1.0;
    return bt;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
