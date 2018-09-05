//
//  ViewController.m
//  CustomCell
//
//  Created by 许小六 on 2018/9/5.
//  Copyright © 2018年 许小六. All rights reserved.
//

#import "ViewController.h"
#import "ChangeView.h"
#import "MyTableViewCell.h"
#import "MyTableViewCellModel.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self tableView];
    
//    ChangeView *v = [[ChangeView alloc] initWithFrame:CGRectMake(50, 100, 300, 80)];
//    v.backgroundColor = [UIColor orangeColor];
//    [v addWithItems:self.dataDic.allValues[2] Columns:4 BtnH:20 BtnLF:10 BtnTB:10];
//    [self.view addSubview:v];
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyTableViewCellModel *model = self.dataArray[indexPath.row];
    return model.currentHeight;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"MyTableViewCellReuse" forIndexPath:indexPath];
    MyTableViewCellModel *model = self.dataArray[indexPath.row];
    cell.model = model;
    cell.indexPath = indexPath;
    __weak typeof(self)ws = self;
    cell.changeBlock = ^(NSIndexPath *indexPath) {
        [ws.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    };
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerNib:[UINib nibWithNibName:@"MyTableViewCell" bundle:nil] forCellReuseIdentifier:@"MyTableViewCellReuse"];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}


- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        MyTableViewCellModel *m1 = [[MyTableViewCellModel alloc] init];
        m1.itemDic = @{@"产品": @[@"产品1", @"产品2", @"产品3", @"产品4", @"产品5", @"产品1", @"产品2", @"产品3", @"产品4", @"产品5", @"产品1", @"产品2", @"产品3", @"产品4", @"产品5"]};
        
        MyTableViewCellModel *m2 = [[MyTableViewCellModel alloc] init];
        m2.itemDic = @{@"仓库": @[@"仓库1", @"仓库2", @"仓库3", @"仓库4", @"仓库5"]};
        
        MyTableViewCellModel *m3 = [[MyTableViewCellModel alloc] init];
        m3.itemDic = @{@"生产": @[@"生产1", @"生产2", @"生产3"]};
        _dataArray = [NSMutableArray arrayWithObjects:m1, m2, m3, nil];
    }
    return _dataArray;
}


@end
