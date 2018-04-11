//
//  UILabel+YFJSetLabelFont.m
//  一番街
//
//  Created by yifanjie on 2017/6/8.
//  Copyright © 2017年 caizhen. All rights reserved.
//

#import "UILabel+YFJSetLabelFont.h"

@implementation UILabel (YFJSetLabelFont)
//设置label各个位置不同的大小
+(NSMutableAttributedString*) changeLabelWithText:(NSString*)needText fontSize:(CGFloat)fontSize
{
    if (needText) {
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:needText];
        NSRange range = NSMakeRange(0, 1);
        NSDictionary *attrs = [NSDictionary dictionaryWithObjectsAndKeys:
                               [UIFont boldSystemFontOfSize:fontSize], NSFontAttributeName,nil];
        
        [str setAttributes:attrs range:range];
        
        return str;

    }else
    {
        return [[NSMutableAttributedString alloc]initWithString:@""];
    }
}

+(NSMutableAttributedString *)setSnapUpStr:(NSString *)snapUpStr titleNameStr:(NSString *)titleName
{
    NSString *str = [NSString stringWithFormat:@"%@/%@",snapUpStr,titleName];
    NSRange range = [str rangeOfString:[NSString stringWithFormat:@"%@/",snapUpStr]];
    if (range.location != NSNotFound) {
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:str];
        [attributedString addAttribute:NSForegroundColorAttributeName value:YFJMainColor range:range];
        return attributedString;
    }else
    {
        return [titleName copy];
    }
}


#pragma mark - 富文本设置部分字体颜色
+ (NSMutableAttributedString *)setupAttributeString:(NSString *)text rangeText:(NSString *)rangeText textColor:(UIColor *)color textFontHeight:(CGFloat)fontHeight {
    
    NSRange hightlightTextRange = [text rangeOfString:rangeText];
    
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:text];
    
    if (hightlightTextRange.length > 0) {
        
        [attributeStr addAttribute:NSForegroundColorAttributeName
         
                             value:color
         
                             range:hightlightTextRange];
        
        [attributeStr addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:fontHeight] range:hightlightTextRange];
        
        return attributeStr;
        
    }else {
        
        return [rangeText copy];
        
    }
    
}

//返回一个划横线的富文本
+(NSMutableAttributedString*)setDelteLineStr:(NSString*)needText
{
    if (needText||[needText isEqualToString:@""]) {
        NSString *textStr = needText;
        NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle],NSBaselineOffsetAttributeName     : @(NSUnderlineStyleSingle)};
        NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:textStr attributes:attribtDic];
        return attribtStr;
    }else
    {
        return [[NSMutableAttributedString alloc]initWithString:@""];
    }
}

@end
