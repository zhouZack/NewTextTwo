//
//  EmployeeService.m
//  OAProject
//
//  Created by Zc_zhou on 15/11/2.
//  Copyright © 2015年 Josh.Shron. All rights reserved.
//

#import "EmployeeService.h"
#import "SquareTableControl.h"
#import "MyQuestionsTableConrol.h"
#import "MyquestionModel.h"
#import "MyQuestionCell.h"
#import "QuestionDetailViewController.h"
#import "AskViewController.h"

@interface EmployeeService ()<UIScrollViewDelegate>
@property (nonatomic, strong) UILabel *lineLabel;
@property (nonatomic, strong) UIButton *squareBtn;
@property (nonatomic, strong) UIButton *questionBtn;
@property (nonatomic, strong) UIScrollView *containerScroll;
@end

@implementation EmployeeService

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor] ;
    if (IOSVersion(7.0)) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.navigationController.navigationBar.barTintColor = [UIColor colorWithHex:@"47a8ef"];
    }
    [self setNav];
    [self reloadView];

}
- (void)setNav
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 80)];
    label.text = @"员工服务台";
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont boldSystemFontOfSize:18];
    self.navigationItem.titleView = label;
    
    UIButton *rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 50)];
    [rightBtn setTitle:@"提问" forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(rightItem) forControlEvents:UIControlEventTouchUpInside];
    [rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
}
- (void)reloadView
{
    _squareBtn = [UIButton createButtonWithFrame:CGRectMake(0, 0, self.view.width/2, 50) target:self action:@selector(squareBtnClick:) title:@"常见广场问题" selectTitle:nil titleColor:[UIColor blackColor] selectColor:[UIColor colorWithHex:@"47a8ef"]];
    _squareBtn.selected = YES;
    [self.view addSubview:_squareBtn];
    
    _questionBtn = [UIButton createButtonWithFrame:CGRectMake(self.view.width/2, 0, self.view.width/2, 50) target:self action:@selector(questionBtnClick:) title:@"我的提问" selectTitle:nil titleColor:[UIColor blackColor] selectColor:[UIColor colorWithHex:@"47a8ef"]];
    [self.view addSubview:_questionBtn];
    
    UILabel*label = [[UILabel alloc] initWithFrame:CGRectMake(0, _squareBtn.bottom, self.view.width, 2)];
    label.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.2];
    [self.view addSubview:label];
    
    _lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _squareBtn.bottom, _squareBtn.width, 2)];
    _lineLabel.backgroundColor = [UIColor colorWithHex:@"47a8ef"];
    [self.view addSubview:_lineLabel];
    
    _containerScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, _lineLabel.bottom, self.view.width, self.view.height-_lineLabel.bottom-64)];
    _containerScroll.delegate = self;
    _containerScroll.contentSize = CGSizeMake(2*self.view.width, 0);
    _containerScroll.backgroundColor = [UIColor grayColor];
    _containerScroll.pagingEnabled = YES;
    _containerScroll.bounces = NO;
    [self.view addSubview:_containerScroll];
    
    __weak EmployeeService *weakSelf = self;
   //加入常见广场问题表格
    SquareTableControl *square = [[SquareTableControl alloc] initWithFrame:CGRectMake(0, 0, _containerScroll.width, _containerScroll.height)];
    square.cellBlock = ^(SquareModel*model)
    {
        NSLog(@"%@",model.title);
    };
    [_containerScroll addSubview:square];
    
    //加入我的提问表格
    MyQuestionsTableConrol *question = [[MyQuestionsTableConrol alloc] initWithFrame:CGRectMake(_containerScroll.width, 0, _containerScroll.width, _containerScroll.height)];
    question.cellBlock1 = ^(MyquestionModel*model)
    {
        QuestionDetailViewController *question = [[QuestionDetailViewController alloc] init];
        [weakSelf.navigationController pushViewController:question animated:YES];
    };
    [_containerScroll addSubview:question];
    
}
- (void)squareBtnClick:(UIButton*)button
{
    button.selected = YES;
    _questionBtn.selected = NO;
    [UIView animateWithDuration:0.5 animations:^{
        _lineLabel.frame = CGRectMake(0, _squareBtn.bottom, _squareBtn.width, 2);
    } completion:^(BOOL finished) {
        _containerScroll.contentOffset = CGPointMake(0, 0);
        
    }];
}
- (void)questionBtnClick:(UIButton*)button
{
    button.selected = YES;
    _squareBtn.selected = NO;
    [UIView animateWithDuration:0.5 animations:^{
        _lineLabel.frame = CGRectMake(_squareBtn.width, _squareBtn.bottom, _squareBtn.width, 2);
    } completion:^(BOOL finished) {
        _containerScroll.contentOffset = CGPointMake(self.view.width, 0);
    }];
}
- (void)rightItem
{
    AskViewController *ask = [[AskViewController alloc] init];
    [self.navigationController pushViewController:ask animated:YES];

}
#pragma mark-UIScrollView代理协议
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int index = (int)(scrollView.contentOffset.x/self.view.width+0.5);
    if (index >= 1) {
        _questionBtn.selected = YES;
        _squareBtn.selected = NO;
        [UIView animateWithDuration:0.5 animations:^{
            _lineLabel.frame = CGRectMake(_squareBtn.width, _squareBtn.bottom, _squareBtn.width, 2);
        }];
    }
    else{
        _squareBtn.selected = YES;
        _questionBtn.selected = NO;
        [UIView animateWithDuration:0.5 animations:^{
            _lineLabel.frame = CGRectMake(0, _squareBtn.bottom, _squareBtn.width, 2);
        }];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
