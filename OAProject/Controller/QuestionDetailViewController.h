//
//  QuestionDetailViewController.h
//  OAProject
//
//  Created by Zc_zhou on 15/11/3.
//  Copyright © 2015年 Josh.Shron. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SquareModel.h"

@interface QuestionDetailViewController : UIViewController
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UILabel *questionTitle;
@property (nonatomic, strong)UILabel *questionDetail;
@property (nonatomic, strong)UILabel *questionDate;
@property (nonatomic, strong)UILabel *answerTitle;
@property (nonatomic ,strong)UILabel *answerDetail;
@property (nonatomic, strong)UILabel *answerDate;




@end
