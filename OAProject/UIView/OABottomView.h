//
//  OABottomView.h
//  OAProject
//
//  Created by Josh.Shron on 15/10/30.
//  Copyright © 2015年 Josh.Shron. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OAAppInfoBtn.h"

@interface OABottomView : UIView

@property (nonatomic, strong) NSMutableArray *infoDatas;
@property (nonatomic, assign) NSInteger btnCount;
@property (nonatomic, copy) AppInfoBlock touchBlock;
@property (nonatomic, assign) BOOL showAll;

@end
