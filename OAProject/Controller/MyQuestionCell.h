//
//  MyQuestionCell.h
//  OAProject
//
//  Created by Zc_zhou on 15/11/3.
//  Copyright © 2015年 Josh.Shron. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyquestionModel.h"


@interface MyQuestionCell : UITableViewCell

@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UILabel *detailLabel;
@property (nonatomic, strong)UILabel *answerLabel;
@property (nonatomic, strong)UILabel *dateLabel;
@property (nonatomic, strong)UIButton *checkBtn;
@property (nonatomic, strong)UILabel *lineLabel;
@property (nonatomic, strong)UILabel *bottomLabel;
@property (nonatomic, assign)BOOL ANSWER;
@property (nonatomic, strong)MyquestionModel *model;

@property(nonatomic,copy)void(^cellBlock)(MyquestionModel*);
- (void)config:(MyquestionModel*)model;


@end
