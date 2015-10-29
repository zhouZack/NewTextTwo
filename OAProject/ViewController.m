//
//  ViewController.m
//  OAProject
//
//  Created by Josh.Shron on 15/10/27.
//  Copyright © 2015年 Josh.Shron. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//@property (nonatomic, strong) UIView *circle;
@property (nonatomic, assign) CGPoint centerPoint;
@property (nonatomic, strong) NSMutableArray *circleArray;
@property (nonatomic, strong) NSNumber *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (IOSVersion(7.0)) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    NSArray *circleSize = @[NSStringFromCGSize(CGSizeMake(self.view.width / 4, self.view.width / 4)),NSStringFromCGSize(CGSizeMake(60, 60)),NSStringFromCGSize(CGSizeMake(60, 60)),NSStringFromCGSize(CGSizeMake(80, 80)),NSStringFromCGSize(CGSizeMake(80, 80))];
    CGPoint centerPoint = CGPointZero;
    _circleArray = [[NSMutableArray alloc] init];
    for (int index = 0; index < circleSize.count;index++ ) {
        CGSize size = CGSizeFromString(circleSize[index]);
        UIView *circle = [[UIView alloc] init];
        circle.size = size;
        circle.centerX = self.view.width / 2;
        circle.centerY = self.view.height / 2 - 100;
        circle.layer.cornerRadius = circle.width / 2;
        circle.tag = index;
        if (index != 0) {
            centerPoint = CGPointMake(_centerPoint.x, _centerPoint.y);
        }
        switch (index) {
            case 0:
            {
                centerPoint = circle.center;
                _centerPoint = centerPoint;
                circle.backgroundColor = [UIColor redColor];
            }
                break;
            case 1:
            {
                circle.centerX = centerPoint.x - 60;
                circle.centerY = centerPoint.y - 60;
                circle.backgroundColor = [UIColor purpleColor];
                break;
            }
            case 2:
            {
                circle.centerX = centerPoint.x + 60;
                circle.centerY = centerPoint.y - 90;
                circle.backgroundColor = [UIColor blackColor];
                break;
            }
            case 3:
            {
                circle.centerX = centerPoint.x - 70;
                circle.centerY = centerPoint.y + 80;
                circle.backgroundColor = [UIColor yellowColor];
                break;
            }
            case 4:
            {
                
                circle.centerX = centerPoint.x + 100;
                circle.centerY = centerPoint.y + 100;
                circle.backgroundColor = [UIColor orangeColor];
                break;
            }
                
            default:
                break;
        }
        [self addanimationWithToPoint:circle.center view:circle];
        [_circleArray addObject:circle];
    }
    
    UIButton *jitterBtn = [[UIButton alloc] init];
    jitterBtn.size = self.view.size;
    [jitterBtn addTarget:self action:@selector(jitterAnimation) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:jitterBtn];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)addanimationWithToPoint:(CGPoint)toPoint view:(UIView *)view
{
    CGPoint startPoint = CGPointMake(_centerPoint.x, _centerPoint.y);
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.fromValue = [NSNumber numberWithFloat:0.001];
    animation.toValue = [NSNumber numberWithFloat:1];
    
    CABasicAnimation *yidong = [CABasicAnimation animationWithKeyPath:@"position"];
    yidong.fromValue = [NSValue valueWithCGPoint:startPoint];
    yidong.toValue = [NSValue valueWithCGPoint:toPoint];
    
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.fromValue = [NSNumber numberWithFloat:0.5];
    opacityAnimation.toValue = [NSNumber numberWithFloat:1.0];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.duration = 1;
    group.repeatCount = 1;
    group.autoreverses = NO;
    group.removedOnCompletion = NO;
    group.fillMode = kCAFillModeForwards;
    group.animations = @[animation,yidong,opacityAnimation];
    [view.layer addAnimation:group forKey:@"yidong"];
    
    
}

- (void)jitterAnimation
{
    self.timer = 0;
}

- (void)setTimer:(NSNumber *)timer
{
    _timer = timer;
    NSInteger index = [timer integerValue];
    if (index < 5) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.view addSubview:_circleArray[index]];
        });
        index ++;
        [self performSelector:@selector(setTimer:) withObject:[NSNumber numberWithInteger:index] afterDelay:1];
    }
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
