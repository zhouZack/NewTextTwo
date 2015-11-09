//
//  MyQuestions.m
//  OAProject
//
//  Created by Zc_zhou on 15/11/3.
//  Copyright © 2015年 Josh.Shron. All rights reserved.
//

#import "MyQuestionsTableConrol.h"
#import "MyQuestionCell.h"
#import "MyquestionModel.h"
@interface MyQuestionsTableConrol()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong)UITableView *tableView;

@end

@implementation MyQuestionsTableConrol

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self createTableView];
    }
    return self;
}
- (void)createTableView
{
    _dateSource = [[NSMutableArray alloc] init];
    for (int i =0; i<4; i++) {
        MyquestionModel *model = [[MyquestionModel alloc] init];
        model.title = @"做财务的能不能转去做业务员";
        model.detail = @"我是在上海集团运营支撑中心做财务管理工作，如今已经工作3年，想试试业务员的工作，挑战下自己，请问需要什么专业知识吗？";
        model.date = @"2015-10-19 15:23";
        if (i == 0) {
            model.answer = NO;
        }else{
            model.answer = YES;
        }
        [_dateSource addObject:model];
    }
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self addSubview:_tableView];
}
#pragma mark-UITableView代理协议

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 143;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dateSource.count;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString*cellId = @"cellId";
    MyQuestionCell*cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell ==nil) {
        cell = [[MyQuestionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    MyquestionModel *model = _dateSource[indexPath.row];
    [cell config:model];
    __weak MyQuestionsTableConrol *weakSelf = self;
    cell.cellBlock =^(MyquestionModel*model)
    {
        if (weakSelf.cellBlock1) {
            weakSelf.cellBlock1(model);
        }
    };

    return cell;
}
@end
