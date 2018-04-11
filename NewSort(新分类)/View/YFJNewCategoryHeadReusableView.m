//
//  YFJNewCategoryHeadReusableView.m
//  一番街
//
//  Created by yifanjie on 2018/1/18.
//  Copyright © 2018年 caizhen. All rights reserved.
//

#import "YFJNewCategoryHeadReusableView.h"
#import "UILabel+YFJSetuptext.h"

@interface YFJNewCategoryHeadReusableView()
{
    UIView *_contentView;
    UIView *_lineView;
    UIView *_lineView1;
    UILabel *_titleLabel;
    UIImageView *_arrowView;
}
@end

@implementation YFJNewCategoryHeadReusableView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIView *contentView = [[UIView alloc]init];
        _contentView = contentView;
        [self addSubview:contentView];
        
        UIView *lineView = [[UIView alloc]init];
        lineView.backgroundColor = YFJGrayColor;
        _lineView = lineView;
        [contentView addSubview:lineView];
        
        UILabel *titleLabel = [UILabel labelInit:@"" textColor:YFJColor(77,77,77) textFontName:YFJFontNameRegular textFont:WCX_SCALE_SCREEN_Height(14)];
        _titleLabel = titleLabel;
        [contentView addSubview:titleLabel];
        
        UIImageView *arrowView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"list_enter-1"]];
        _arrowView = arrowView;
        [arrowView sizeToFit];
        [contentView addSubview:arrowView];
        
        UIView *lineView1 = [[UIView alloc]init];
        _lineView1 = lineView1;
        lineView1.backgroundColor = YFJGrayColor;
        [contentView addSubview:lineView1];
    }
    return self;
}

-(void)setTitleStr:(NSString *)titleStr
{
    _titleStr = titleStr;
   
    [_titleLabel setText:titleStr];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_offset(0);
    }];
    
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_offset(0);
        make.top.mas_offset(0);
        make.height.mas_offset(WCX_SCALE_SCREEN_Height(0.5));
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(WCX_SCALE_SCREEN_Width(20));
        make.centerY.mas_equalTo(_contentView);
    }];
    
    [_arrowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(WCX_SCALE_SCREEN_Width(-20));
        make.centerY.mas_equalTo(_contentView);
    }];
    
    [_lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_offset(0);
        make.height.mas_offset(WCX_SCALE_SCREEN_Height(0.5));
    }];
}


@end
