//
//  YFJNewBrandListCell.m
//  一番街
//
//  Created by yifanjie on 2018/1/19.
//  Copyright © 2018年 caizhen. All rights reserved.
//

#import "YFJNewBrandListCell.h"
#import "UILabel+YFJSetuptext.h"

@interface YFJNewBrandListCell()
{
    UIImageView *_imageView;
    UILabel *_titleLabel;
}
@end

@implementation YFJNewBrandListCell

//品牌页的列表cell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setContent];
    }
    return self;
}

-(void)setContent
{
    UIImageView *imageView = [[UIImageView alloc]init];
    _imageView = imageView;
    imageView.layer.borderColor = [UIColor grayColor].CGColor;
    imageView.layer.borderWidth = 0.5;
    [self.contentView addSubview:imageView];
    
    UILabel *titleLabel = [UILabel labelInit:@"品牌名字" textColor:[UIColor blackColor] textFontName:0 textFont:13];
    _titleLabel = titleLabel;
    [self.contentView addSubview:titleLabel];
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(WCX_SCALE_SCREEN_Width(20));
        make.centerY.mas_equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(WCX_SCALE_SCREEN_Height(70), WCX_SCALE_SCREEN_Height(20)));
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_imageView.mas_right).offset(WCX_SCALE_SCREEN_Width(10));;
        make.centerY.mas_equalTo(self.contentView);
    }];
}



@end
