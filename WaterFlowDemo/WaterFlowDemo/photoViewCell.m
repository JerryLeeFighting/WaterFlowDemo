//
//  photoViewCell.m
//  WaterFlowDemo
//
//  Created by 萨斯辈的呼唤 on 14-6-23.
//  Copyright (c) 2014年 萨斯辈的呼唤. All rights reserved.
//

#import "photoViewCell.h"

@implementation photoViewCell

-(void)dealloc
{
    [_photoView release];
    [_titleLabel release];
    [super dealloc];
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (UIImageView *)photoView
{
    if (nil == _photoView) {
        self.photoView = [[UIImageView alloc] init];
        _photoView.contentMode = UIViewContentModeScaleAspectFill;
        _photoView.clipsToBounds = YES;
        [self addSubview:_photoView];
        [_photoView release];
    }
    return _photoView;
}

- (UILabel *)titleLabel
{
    if (nil == _titleLabel) {
        self.titleLabel = [[UILabel alloc] init];
        _titleLabel.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titleLabel];
        [_titleLabel release];
    }
    return _titleLabel;
}

- (void)layoutSubviews
{
    self.photoView.frame = CGRectInset(self.bounds, 5, 5);
    self.titleLabel.frame = CGRectMake(5, self.bounds.size.height - 20 - 5, self.bounds.size.width - 2 * 5, 20);
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
