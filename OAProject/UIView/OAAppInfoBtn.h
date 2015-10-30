//
//  OAAppInfoBtn.h
//  OAProject
//
//  Created by Josh.Shron on 15/10/30.
//  Copyright © 2015年 Josh.Shron. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^AppInfoBlock)(NSInteger tag);

@interface OAAppInfoBtn : UIView

@property (nonatomic, copy) AppInfoBlock touchBlock;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *imageName;

@end
