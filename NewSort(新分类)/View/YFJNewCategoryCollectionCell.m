//
//  YFJNewCategoryCollectionCell.m
//  一番街
//
//  Created by yifanjie on 2018/1/18.
//  Copyright © 2018年 caizhen. All rights reserved.
//

#import "YFJNewCategoryCollectionCell.h"
#import "UILabel+YFJSetuptext.h"

@interface YFJNewCategoryCollectionCell()
{
    UILabel *_titleLabel;
}
@end

@implementation YFJNewCategoryCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    UILabel *titleLabel = [UILabel labelInit:@"" textColor:YFJNextTitleColor textFontName:YFJFontNameRegular textFont:WCX_SCALE_SCREEN_Height(11)];
    _titleLabel = titleLabel;
    titleLabel.layer.borderColor = YFJColor(232,232,232).CGColor;
    titleLabel.layer.borderWidth = 0.5;
    titleLabel.layer.cornerRadius = WCX_SCALE_SCREEN_Height(4);
    titleLabel.textAlignment = NSTextAlignmentCenter;
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
        make.left.right.top.bottom.mas_offset(0);
    }];
    
}



@end
