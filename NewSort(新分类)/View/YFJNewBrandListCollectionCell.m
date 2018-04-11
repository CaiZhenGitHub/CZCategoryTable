//
//  YFJNewBrandListCollectionCell.m
//  一番街
//
//  Created by yifanjie on 2018/1/19.
//  Copyright © 2018年 caizhen. All rights reserved.
//

#import "YFJNewBrandListCollectionCell.h"
#import "UILabel+YFJSetuptext.h"

@interface YFJNewBrandListCollectionCell()
{
    UIImageView *_imageView;
    UILabel *_titleLabel;
}
@end


@implementation YFJNewBrandListCollectionCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setContent];
        self.backgroundColor = YFJRandomColor;
    }
    return self;
}

-(void)setTitleStr:(NSString *)titleStr
{
    _titleStr = titleStr;
    
    [_titleLabel setText:titleStr];
}


-(void)setContent
{
    
    UIImageView *imageView = [[UIImageView alloc]init];
    _imageView = imageView;
    [self addSubview:imageView];
    
    UILabel *titleLabel = [UILabel labelInit:@"" textColor:YFJColor(34,34,34) textFontName:YFJFontNameRegular textFont:WCX_SCALE_SCREEN_Height(11)];
    _titleLabel = titleLabel;
    [self addSubview:titleLabel];
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.contentView);
        make.top.mas_offset(WCX_SCALE_SCREEN_Height(23));
        make.size.mas_equalTo(CGSizeMake(WCX_SCALE_SCREEN_Height(110), WCX_SCALE_SCREEN_Height(31)));
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(_imageView);
        make.top.mas_equalTo(_imageView.mas_bottom).offset(WCX_SCALE_SCREEN_Height(15));
    }];
    
}





@end
