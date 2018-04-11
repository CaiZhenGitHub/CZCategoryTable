//
//  UILabel+YFJSetuptext.m
//  一番街
//
//  Created by yifanjie on 2017/3/9.
//  Copyright © 2017年 caizhen. All rights reserved.
//

#import "UILabel+YFJSetuptext.h"

@implementation UILabel (YFJSetuptext)

//uilabel封装  返回一个设置好的label
+ (instancetype)labelSetuptext:(NSString *)text textColor:(UIColor *)textColor textFont:(CGFloat)textFont textAlignment:(NSTextAlignment)textAlignment numberOfLines:(NSInteger)numberOfLines
{
    UILabel *label = [[UILabel alloc] init];
    label.textColor = textColor;
    label.font = [UIFont systemFontOfSize:YFJScreenH/667*textFont];
    label.textAlignment = textAlignment;
    label.text = text;
    label.numberOfLines = numberOfLines;
    
    return label;
}


+ (instancetype)labelInit:(NSString *)text textColor:(UIColor *)textColor textFontName:(NSString *)fontName textFont:(CGFloat)textFont
{
    UILabel *label = [[UILabel alloc] init];
    
    [label setText:text];
    [label setFont:[UIFont fontWithName:@"STHeitiSC-Light" size:textFont]];
    [label setTextColor:textColor];
    label.numberOfLines = 0;
    [label sizeToFit];
    return label;
}


@end
