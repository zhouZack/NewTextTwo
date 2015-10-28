//
//  ViewController.m
//  OAProject
//
//  Created by Josh.Shron on 15/10/27.
//  Copyright © 2015年 Josh.Shron. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *circle;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (IOSVersion(7.0)) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    UIView *circle = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width - 50, 0)];
    circle.height = circle.width;
    circle.centerX = self.view.width / 2;
    circle.top = 30;
    circle.userInteractionEnabled = YES;
    circle.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:circle];
    _circle = circle;
    
    UIButton *jitterBtn = [[UIButton alloc] initWithFrame:circle.frame];
    jitterBtn.size = circle.size;
    [jitterBtn addTarget:self action:@selector(jitterAnimation) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:jitterBtn];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)jitterAnimation
{
//    [_circle locaAnimationWithType:2 rados:5 repeatCount:5 duration:0];
//    [_circle jitterAnimationWithRotation:0];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
