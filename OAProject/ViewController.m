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
//    circle.layer.cornerRadius = circle.width / 2;
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
    
    CGAffineTransform t1 = CGAffineTransformMakeRotation(0.03);
    CGAffineTransform t2 = CGAffineTransformMakeRotation(-0.03);
    _circle.transform = t1;
    [UIView animateWithDuration:0.1 delay:0.0 options:UIViewAnimationOptionAutoreverse|UIViewAnimationOptionRepeat animations:^{
        //[UIView setAnimationRepeatCount:12.0];
        _circle.transform = t2;
    } completion:^(BOOL finished){
        
        [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^
         {
             CGAffineTransform t = CGAffineTransformMakeScale(1,1);
             for (UIView * view in self.view.subviews)
             {
                 view.tag = 0;
                 view.transform = t;
             }
         } completion:^(BOOL finished)
         {
             NSLog(@"完成");
         }];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
