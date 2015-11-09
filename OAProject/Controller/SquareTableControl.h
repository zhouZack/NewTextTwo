//
//  SquareTableControl.h
//  OAProject
//
//  Created by Zc_zhou on 15/11/2.
//  Copyright © 2015年 Josh.Shron. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SquareModel.h"
@interface SquareTableControl : UIControl
@property (nonatomic, strong)NSMutableArray *dataSource;
@property (nonatomic ,strong)NSArray *sectionSource;

@property (nonatomic, copy)void(^cellBlock)(SquareModel*);

@end
