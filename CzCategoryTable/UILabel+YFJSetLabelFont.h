//
//  UILabel+YFJSetLabelFont.h
//  一番街
//
//  Created by yifanjie on 2017/6/8.
//  Copyright © 2017年 caizhen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (YFJSetLabelFont)


//改变第一个人民币符号的大小
+(NSMutableAttributedString*) changeLabelWithText:(NSString*)needText fontSize:(CGFloat)fontSize;
//划线价格
+(NSMutableAttributedString*)setDelteLineStr:(NSString*)needText;

//富文本设置部分字体颜色
+ (NSMutableAttributedString *)setupAttributeString:(NSString *)text rangeText:(NSString *)rangeText textColor:(UIColor *)color textFontHeight:(CGFloat)fontHeight;
//返回设置好的标签文字颜色改变的富文本
+(NSMutableAttributedString *)setSnapUpStr:(NSString *)snapUpStr titleNameStr:(NSString *)titleName;

@end
