//
//  AskViewController.m
//  OAProject
//
//  Created by Zc_zhou on 15/11/4.
//  Copyright © 2015年 Josh.Shron. All rights reserved.
//

#import "AskViewController.h"

@interface AskViewController ()<UITextFieldDelegate>

@end

@implementation AskViewController

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
    UITextField * field = [[UITextField alloc] initWithFrame:CGRectMake(10, 10, ScreenWidth-20, 30)];
    field.placeholder = @"请输入问题的标题";
    field.font = [UIFont systemFontOfSize:15];
//    field.clearsOnBeginEditing =YES;
    [self.view addSubview:field];
    
    UILabel *lineLale = [[UILabel alloc] initWithFrame:CGRectMake(0, field.bottom+5, ScreenWidth, 1)];
    lineLale.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.3];
    [self.view addSubview:lineLale];
    
    UIButton *submitBtn = [UIButton createButtonWithFrame:CGRectZero target:self action:@selector(submitBtnClick:) title:@"提交" selectTitle:nil titleColor:[UIColor whiteColor] selectColor:nil];;
    submitBtn.width = ScreenWidth-80;
    submitBtn.height = 30;
    submitBtn.centerX = ScreenWidth/2;
    submitBtn.centerY = ScreenHeight/2;
    submitBtn.layer.cornerRadius = 15;
    submitBtn.backgroundColor = [UIColor colorWithHex:@"47a8ef"];
    
    [self.view addSubview:submitBtn];

}
- (void)submitBtnClick:(id)sender{
    
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
