//
//  UIButton+Extension.m
//  OAProject
//
//  Created by Zc_zhou on 15/11/2.
//  Copyright © 2015年 Josh.Shron. All rights reserved.
//

#import "UIButton+Extension.h"

@implementation UIButton (Extension)
+(UIButton*)createButtonWithFrame:(CGRect)frame target:(id)target action:(SEL)action title:(NSString*)title selectTitle:(NSString*)seleceTitle titleColor:(UIColor*)color selectColor:(UIColor*)selectColor
{
    UIButton*btn = [[UIButton alloc] initWithFrame:frame];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitle:seleceTitle forState:UIControlStateSelected];
    [btn setTitleColor:color forState:UIControlStateNormal];
    [btn setTitleColor:selectColor forState:UIControlStateSelected];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}

+(UIButton*)createButtonWithImage:(NSString*)image selectImage:(NSString*)selectImage target:(id)target action:(SEL)action{
    UIButton *btn = [[UIButton alloc] init];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:selectImage] forState:UIControlStateSelected];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return btn;
}
@end
