//
//  MyQuestions.h
//  OAProject
//
//  Created by Zc_zhou on 15/11/3.
//  Copyright © 2015年 Josh.Shron. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyquestionModel.h"
@interface MyQuestionsTableConrol : UIControl

@property (nonatomic, strong)NSMutableArray *dateSource;

@property (nonatomic, copy)void(^cellBlock1)(MyquestionModel*);

@end
