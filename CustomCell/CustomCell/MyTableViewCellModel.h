//
//  MyTableViewCellModel.h
//  CustomCell
//
//  Created by 许小六 on 2018/9/5.
//  Copyright © 2018年 许小六. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MyTableViewCellModel : NSObject

@property (nonatomic, assign) BOOL isShow;
@property (nonatomic, strong) NSDictionary *itemDic;
@property (nonatomic, assign) CGFloat currentHeight;

@end
