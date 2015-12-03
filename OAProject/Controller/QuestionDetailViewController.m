//
//  QuestionDetailViewController.m
//  OAProject
//
//  Created by Zc_zhou on 15/11/3.
//  Copyright © 2015年 Josh.Shron. All rights reserved.
//

#import "QuestionDetailViewController.h"

@interface QuestionDetailViewController ()
@property (nonatomic, strong)NSArray*estimateBtnArray;
@end

@implementation QuestionDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor] ;
    if (IOSVersion(7.0)) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.navigationController.navigationBar.barTintColor = [UIColor colorWithHex:@"47a8ef"];
    }
    [self reloadView];
}

- (void)reloadView
{
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 80)];
    _titleLabel.text = @"我的提问";
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.font = [UIFont boldSystemFontOfSize:18];
    self.navigationItem.titleView = _titleLabel;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, ScreenHeight-64-150, ScreenWidth, 150)];
    view.backgroundColor = [UIColor whiteColor];
    UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, view.width, 1)];
    lineLabel.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.3];
    [view addSubview:lineLabel];
    
    UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, 100, 25)];
    titleLabel.font = [UIFont systemFontOfSize:16];
    titleLabel.text = @"对回答的评分";
    [view addSubview:titleLabel];
    
    UIButton *leftBtn = [UIButton createButtonWithImage:@"btn2" selectImage:@"btn1" target:self action:@selector(estimateBtnClick:)];
    leftBtn.selected = YES;
    leftBtn.tag = 10;
    leftBtn.top = titleLabel.bottom+20;
    leftBtn.backgroundColor = [UIColor clearColor];
    leftBtn.width = 20;
    leftBtn.height=20;
    leftBtn.centerX = ScreenWidth/5-20;
    [view addSubview:leftBtn];
    
    UIButton *centreBtn = [UIButton createButtonWithImage:@"btn2" selectImage:@"btn1" target:self action:@selector(estimateBtnClick:)];
    centreBtn.top = titleLabel.bottom+20;
    centreBtn.tag = 11;
    centreBtn.backgroundColor = [UIColor colorWithHex:@"47a8ef"];
    centreBtn.width = 20;
    centreBtn.height=20;
    centreBtn.centerX = ScreenWidth/2-20;
    [view addSubview:centreBtn];
    

    UIButton *rightBtn = [UIButton createButtonWithImage:@"btn2" selectImage:@"btn1" target:self action:@selector(estimateBtnClick:)];
    rightBtn.tag = 12;
    rightBtn.top = titleLabel.bottom+20;
    rightBtn.backgroundColor = [UIColor colorWithHex:@"47a8ef"];
    rightBtn.width = 20;
    rightBtn.height=20;
    rightBtn.centerX = (ScreenWidth/5)*4-20;
    [view addSubview:rightBtn];
    
    self.estimateBtnArray = @[leftBtn,centreBtn,rightBtn];
    
    
    UILabel*leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(leftBtn.right, titleLabel.bottom+15, 80, 30)];
    leftLabel.font = [UIFont systemFontOfSize:14];
    leftLabel.text = @"十分满意";
    [view addSubview:leftLabel];
    
    UILabel*centreLabel = [[UILabel alloc] initWithFrame:CGRectMake(centreBtn.right, titleLabel.bottom+15, 50, 30)];
    centreLabel.font = [UIFont systemFontOfSize:14];
    centreLabel.text = @"满意";
    [view addSubview:centreLabel];
    
    UILabel*rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(rightBtn.right, titleLabel.bottom+15, 80, 30)];
    rightLabel.font = [UIFont systemFontOfSize:14];
    rightLabel.text = @"不满意";
    [view addSubview:rightLabel];
    
    UIButton *submitBtn = [UIButton createButtonWithFrame:CGRectZero target:self action:@selector(submitBtnClick:) title:@"提交" selectTitle:nil titleColor:[UIColor whiteColor] selectColor:nil];;
    submitBtn.top = centreBtn.bottom+15;
    submitBtn.width = ScreenWidth-80;
    submitBtn.layer.cornerRadius = 15;
    submitBtn.height = 30;
    submitBtn.centerX = ScreenWidth/2;
    submitBtn.backgroundColor = [UIColor colorWithHex:@"47a8ef"];
    
    [view addSubview:submitBtn];
    [self.view addSubview:view];
    
    UILabel*ask = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 30, 20)];
    ask.textColor = [UIColor colorWithHex:@"47a8ef"];
    ask.text = @"问:";
    [self.view addSubview:ask];
    
    _questionTitle = [[UILabel alloc] initWithFrame:CGRectMake(ask.right, 10, ScreenWidth-50, 20)];
    _questionTitle.textAlignment = NSTextAlignmentLeft;
    _questionTitle.text = self.model.title;
    [self.view addSubview:_questionTitle];
    
    _questionDetail = [[UILabel alloc] initWithFrame:CGRectMake(10, ask.bottom+10, ScreenWidth-20, 30)];
    _questionDetail.numberOfLines = 0;
    _questionDetail.lineBreakMode = NSLineBreakByWordWrapping;
    _questionDetail.font = [UIFont systemFontOfSize:14];
    _questionDetail.textColor = [[UIColor grayColor] colorWithAlphaComponent:0.5];
    _questionDetail.text = self.model.detail;
    CGSize size = [_questionDetail sizeThatFits:CGSizeMake(_questionDetail.width, MAXFLOAT)];
    CGRect frame = _questionDetail.frame;
    frame.size.height = size.height;
    _questionDetail.frame = frame;
    [self.view addSubview:_questionDetail];
    
    _questionDate = [[UILabel alloc] initWithFrame:CGRectMake(10, _questionDetail.bottom+5, 120, 20)];
    _questionDate.font = [UIFont systemFontOfSize:12];
    _questionDate.textColor = [[UIColor grayColor] colorWithAlphaComponent:0.5];
    _questionDate.text = self.model.date;
    [self.view addSubview:_questionDate];
    
    UILabel *lineLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(0, _questionDate.bottom+15, ScreenWidth, 10)];
    lineLabel2.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.3];
    [self.view addSubview:lineLabel2];
    
    UILabel *answer = [[UILabel alloc] initWithFrame:CGRectMake(10, lineLabel2.bottom+10, 30, 20)];
    answer.textColor = [UIColor greenColor];
    answer.text = @"答:";
    [self.view addSubview:answer];
    
    _answerTitle = [[UILabel alloc] initWithFrame:CGRectMake(answer.right, answer.top, ScreenWidth-50, 20)];
    _answerTitle.textAlignment = NSTextAlignmentLeft;
    _answerTitle.text = @"人力资源工作人员1";
    [self.view addSubview:_answerTitle];
    
    _answerDetail = [[UILabel alloc] initWithFrame:CGRectMake(10, answer.bottom+10, ScreenWidth-20, 30)];
    _answerDetail.numberOfLines = 0;
    _answerDetail.lineBreakMode = NSLineBreakByWordWrapping;
    _answerDetail.font = [UIFont systemFontOfSize:14];
    _answerDetail.textColor = [[UIColor grayColor] colorWithAlphaComponent:0.5];
    _answerDetail.text = @"你可以看下相关专业知识，可以转岗，但是需要考验的专业知识是不是过硬，公司内部转岗的话，工作地点不能随意选择，只能根据公司分配。";
    CGSize size2 = [_answerDetail sizeThatFits:CGSizeMake(_answerDetail.width, MAXFLOAT)];
    CGRect frame2 = _answerDetail.frame;
    frame2.size.height = size2.height;
    _answerDetail.frame = frame2;
    [self.view addSubview:_answerDetail];
    
    _answerDate = [[UILabel alloc] initWithFrame:CGRectMake(10, _answerDetail.bottom+5, 120, 20)];
    _answerDate.font = [UIFont systemFontOfSize:12];
    _answerDate.textColor = [[UIColor grayColor] colorWithAlphaComponent:0.5];
    _answerDate.text = @"2015-10-21 10:20";
    [self.view addSubview:_answerDate];
}


- (void)estimateBtnClick:(UIButton*)button
{
    for (UIButton *btn in self.estimateBtnArray) {
        if (btn.tag == button.tag) {
            btn.selected = YES;
        }else{
            btn.selected = NO;
        }
    }
}
- (void)submitBtnClick:(UIButton*)button
{
    NSLog(@"点击提交按钮");
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
