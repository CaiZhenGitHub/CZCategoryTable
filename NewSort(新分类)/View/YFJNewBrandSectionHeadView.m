//
//  YFJNewBrandSectionHeadView.m
//  一番街
//
//  Created by yifanjie on 2018/1/19.
//  Copyright © 2018年 caizhen. All rights reserved.
//

#import "YFJNewBrandSectionHeadView.h"
#import "UILabel+YFJSetuptext.h"

@interface YFJNewBrandSectionHeadView()
{
    UILabel *_titleLabel;
}
@end

@implementation YFJNewBrandSectionHeadView

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self setContent];
        self.contentView.backgroundColor = YFJColor(247,247,247);
    }
    return self;
}

-(void)setContent
{
    UILabel *titleLabel = [UILabel labelInit:@"" textColor:YFJTagColor textFontName:YFJFontNameRegular textFont:WCX_SCALE_SCREEN_Height(12)];
    _titleLabel = titleLabel;
    [self.contentView addSubview:titleLabel];
}

-(void)setTitleStr:(NSString *)titleStr
{
    _titleStr = titleStr;
    
    [_titleLabel setText:titleStr];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self);
    }];
}


@end
