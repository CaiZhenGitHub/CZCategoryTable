//
//  UIView+Frame.h
//  BuDeJie
//
//  Created by mac on 16/4/26.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)
// 分类里不能声明成员变量，但是可以声明方法
// 使用的是属性的getter和setter方法
@property CGFloat yj_width;
@property CGFloat yj_height;
@property CGFloat yj_x;
@property CGFloat yj_y;
@property CGFloat yj_centerX;
@property CGFloat yj_centerY;

@end
