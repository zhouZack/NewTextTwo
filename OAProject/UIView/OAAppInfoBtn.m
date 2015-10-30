//
//  OAAppInfoBtn.m
//  OAProject
//
//  Created by Josh.Shron on 15/10/30.
//  Copyright © 2015年 Josh.Shron. All rights reserved.
//

#import "OAAppInfoBtn.h"

@interface OAAppInfoBtn ()

@property (nonatomic, strong) UIImageView *headerImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *touchBtn;

@end

@implementation OAAppInfoBtn

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initView];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    _touchBtn.size = self.size;
    _headerImageView.width = _headerImageView.height = self.height / 2;
    _headerImageView.centerX = self.width / 2;
    _headerImageView.top = 5;
    
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.width, 15)];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    _titleLabel.text = _title;
    _titleLabel.centerY = (self.height - _headerImageView.bottom ) / 2 + _headerImageView.bottom;
    [self insertSubview:_titleLabel belowSubview:_touchBtn];
}

-(void)initView
{
    self.backgroundColor = [UIColor clearColor];
    _headerImageView = [[UIImageView alloc] init];
    _headerImageView.userInteractionEnabled = YES;
    [self addSubview:_headerImageView];
    
    _touchBtn = [[UIButton alloc] init];
    _touchBtn.backgroundColor = [UIColor clearColor];
    [_touchBtn addTarget:self action:@selector(touchEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_touchBtn];
}

- (void)touchEvent:(id)sender
{
    if (self.touchBlock) {
        self.touchBlock(self.tag);
    }
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    _titleLabel.text = title;
}

- (void)setImageName:(NSString *)imageName
{
    _imageName = imageName;
    NSRange range = [imageName rangeOfString:@"http"];
    if (range.length) {
        [_headerImageView setCacheImageWithURL:[NSURL URLWithString:imageName]];
    } else {
        [_headerImageView setImage:[UIImage imageNamed:imageName]];
    }
}

@end
