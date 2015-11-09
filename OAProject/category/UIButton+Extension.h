//
//  UIButton+Extension.h
//  OAProject
//
//  Created by Zc_zhou on 15/11/2.
//  Copyright © 2015年 Josh.Shron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Extension)
+(UIButton*)createButtonWithFrame:(CGRect)frame target:(id)target action:(SEL)action title:(NSString*)title selectTitle:(NSString*)seleceTitle titleColor:(UIColor*)color selectColor:(UIColor*)selectColor;
+(UIButton*)createButtonWithImage:(NSString*)image selectImage:(NSString*)selectImage target:(id)target action:(SEL)action;

@end
