//
//  UILabel+YFJSetuptext.h
//  一番街
//
//  Created by yifanjie on 2017/3/9.
//  Copyright © 2017年 caizhen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (YFJSetuptext)

+ (instancetype)labelSetuptext:(NSString *)text textColor:(UIColor *)textColor textFont:(CGFloat)textFont textAlignment:(NSTextAlignment)textAlignment numberOfLines:(NSInteger)numberOfLines;


+ (instancetype)labelInit:(NSString *)text textColor:(UIColor *)textColor textFontName:(NSString *)fontName textFont:(CGFloat)textFont;



@end
