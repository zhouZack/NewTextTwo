//
//  MyQuestionCell.m
//  OAProject
//
//  Created by Zc_zhou on 15/11/3.
//  Copyright © 2015年 Josh.Shron. All rights reserved.
//

#import "MyQuestionCell.h"

@implementation MyQuestionCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self reloadView];
    }
    return self;
    
}

-(void)setANSWER:(BOOL)ANSWER
{
    _ANSWER = ANSWER;
    if (self.ANSWER ==YES) {
        _answerLabel.text = @"已回答";
        _answerLabel.textColor = [UIColor greenColor];
    }else{
        _answerLabel.textColor = [UIColor redColor];
        _answerLabel.text = @"未回答";
    }
}
- (void)reloadView
{
    //136
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, ScreenWidth-20, 30)];
    _titleLabel.font = [UIFont systemFontOfSize:17];
    _titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_titleLabel];
    
    _detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, _titleLabel.bottom, _titleLabel.width, 60)];
    _detailLabel.textColor = [[UIColor grayColor] colorWithAlphaComponent:0.5];
    _detailLabel.numberOfLines = 2;
    _detailLabel.font = [UIFont systemFontOfSize:14];
    _detailLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_detailLabel];
    
    _lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, _detailLabel.bottom, _titleLabel.width, 1)];
    _lineLabel.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.1];
    [self.contentView addSubview:_lineLabel];
    
    _answerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _lineLabel.bottom, 60, 40)];
    _answerLabel.font = [UIFont systemFontOfSize:14];
    _answerLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_answerLabel];
    
    _dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(_answerLabel.right, _lineLabel.bottom, ScreenWidth-150, 40)];
    _dateLabel.textAlignment = NSTextAlignmentLeft;
    _dateLabel.font = [UIFont systemFontOfSize:13];
    _dateLabel.textColor = [[UIColor grayColor] colorWithAlphaComponent:0.7];
    [self.contentView addSubview:_dateLabel];
    
    _checkBtn = [UIButton createButtonWithFrame:CGRectMake(_dateLabel.right, _lineLabel.bottom, 80, 40) target:self action:@selector(checkBtnClick:) title:@"查看详情>>" selectTitle:nil titleColor:[UIColor colorWithHex:@"47a8ef"] selectColor:nil];
    [_checkBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    _checkBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:_checkBtn];
    
    _bottomLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _answerLabel.bottom, ScreenWidth, 10)];
    _bottomLabel.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.1];
    [self.contentView addSubview:_bottomLabel];
    
    
}

- (void)checkBtnClick:(UIButton*)button
{
    if (self.cellBlock) {
        self.cellBlock(self.model);
    }

    
}
- (void)config:(MyquestionModel*)model
{
    self.model = model;
    
    _titleLabel.text = model.title;
    _detailLabel.text = model.detail;
    self.ANSWER = model.answer;
    _dateLabel.text = model.date;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
