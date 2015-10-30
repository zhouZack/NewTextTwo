//
//  OABottomView.m
//  OAProject
//
//  Created by Josh.Shron on 15/10/30.
//  Copyright © 2015年 Josh.Shron. All rights reserved.
//

#import "OABottomView.h"

@interface OABottomView ()

@property (nonatomic, assign) CGFloat topHeight;
@property (nonatomic, assign) CGFloat originY;
@property (nonatomic, strong) UIButton *topBtn;
@property (nonatomic, assign) CGFloat viewHeight;
@property (nonatomic, strong) NSMutableArray *btnArray;

@end

@implementation OABottomView

- (void)setInfoDatas:(NSMutableArray *)infoDatas
{
    _infoDatas = infoDatas;
    _viewHeight = self.height;
    if (_btnCount == 0) {
        self.btnCount = 4;
    }
    _topHeight = 30;
    CGFloat width = self.width /  _btnCount;
    CGFloat height = (self.height - _topHeight) / 2;
    _btnArray = [[NSMutableArray alloc] init];
    for (int index = 0; index < _infoDatas.count; index ++) {
        NSInteger pageCount = _btnCount * 2;
        NSInteger pageNO = index / pageCount;
        NSInteger section = (index - pageNO * pageCount) / _btnCount;
        NSInteger row = index - pageNO  * pageCount - _btnCount * section;
        
        NSDictionary *dictionary = infoDatas[index];
        OAAppInfoBtn *infoBtn = [[OAAppInfoBtn alloc] initWithFrame:CGRectZero];
//        infoBtn.backgroundColor = [UIColor redColor];
        infoBtn.title = dictionary[@"title"];
        infoBtn.imageName = dictionary[@"imageName"];
        infoBtn.width = width;
        infoBtn.height = height;
        infoBtn.top = infoBtn.height * section + _topHeight;
        infoBtn.left = self.width * pageNO + row * infoBtn.width;
        infoBtn.tag = index;
        infoBtn.touchBlock = ^(NSInteger index) {
            if (self.touchBlock) {
                self.touchBlock(index);
            }
        };
        [_btnArray addObject:infoBtn];
        [self addSubview:infoBtn];
    }
    
    UIImage *image = [UIImage imageNamed:@"arrow"];
    _topBtn = [[UIButton alloc] init];
    _topBtn.size = CGSizeMake(image.size.width * 2, image.size.height * 2);
    [_topBtn setBackgroundImage:image forState:0];
    _topBtn.centerX = self.width / 2;
    _topBtn.top = 5;
    [_topBtn addTarget:self action:@selector(showLine) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_topBtn];
    _originY = self.top;
    self.showAll = NO;
}

- (void)showLine
{
    self.showAll = !self.showAll;
}

- (void)setShowAll:(BOOL)showAll
{
    _showAll = showAll;
    CGFloat btnHeight = (_viewHeight - _topHeight) / 2 + _topHeight;
    if (showAll) {
        //        显示两行
        self.height = _viewHeight;
        if (self.top != _originY) {
            _topBtn.transform = CGAffineTransformMakeRotation(180 * M_PI / 180.0);
        }
        [UIView animateWithDuration:1 animations:^{
            if (self.top != _originY) {
                self.top = _originY;
            }
        }];
    } else {
//        显示一行
        if (self.top == _originY) {
            _topBtn.transform = CGAffineTransformMakeRotation(0 * M_PI / 180.0);
        }
        [UIView animateWithDuration:1 animations:^{
            if (self.top == _originY) {
                self.top += (btnHeight - _topHeight);
            }
        } completion:^(BOOL finished) {
            self.height = (_viewHeight - _topHeight) / 2 + _topHeight;
        }];
    }
}



@end
