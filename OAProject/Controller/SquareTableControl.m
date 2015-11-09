//
//  SquareTableControl.m
//  OAProject
//
//  Created by Zc_zhou on 15/11/2.
//  Copyright © 2015年 Josh.Shron. All rights reserved.
//

#import "SquareTableControl.h"

@interface SquareTableControl()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong)UITableView *tableView;


@end
@implementation SquareTableControl

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self createTableView];
    }
    return self;
}

- (void)createTableView
{    _sectionSource = @[@"财务类",@"购物类",@"支付类"];
    
    _dataSource = [[NSMutableArray alloc] init];
    for (int i =0; i<3; i++) {
        NSMutableArray *sectionArray = [NSMutableArray array];
        for (int j=0; j<4; j++) {
            NSString*string = [NSString stringWithFormat:@"常见问题广场的第%d个问题？",i];
            SquareModel *model = [[SquareModel alloc] init];
            model.title = string;
            [sectionArray addObject:model];
        }
        [_dataSource addObject:sectionArray];
    }
    
    _tableView = [[UITableView alloc] initWithFrame:self.frame];
    _tableView.delegate = self;
    _tableView.dataSource = self;
   
    [self addSubview:_tableView];
    

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataSource.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *array = _dataSource[section];
    return array.count;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString*cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell ==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    
    SquareModel *model = _dataSource[indexPath.section][indexPath.row];
    cell.textLabel.text = model.title;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width, 50)];
    view.backgroundColor = [UIColor whiteColor];
    UILabel *lineLael = [[UILabel alloc] initWithFrame:CGRectMake(10, view.bottom-1, self.width-20, 1)];
    lineLael.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.3];
    [view addSubview:lineLael];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 60, 50)];
    label.textColor = [UIColor colorWithHex:@"47a8ef"];
    label.text = _sectionSource[section];
    [view addSubview:label];
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SquareModel *model = _dataSource[indexPath.section][indexPath.row];
    
    if (self.cellBlock) {
        self.cellBlock(model);
    }
}

@end
