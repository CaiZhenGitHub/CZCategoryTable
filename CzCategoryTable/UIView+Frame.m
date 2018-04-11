//
//  UIView+Frame.m
//  BuDeJie
//
//  Created by mac on 16/4/26.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)
- (CGFloat)yj_width
{
    return self.frame.size.width;
}

- (void)setYj_width:(CGFloat)yj_width
{
    CGRect frame = self.frame;
    frame.size.width = yj_width;
    self.frame = frame;
}

-(CGFloat)yj_height
{
    return self.frame.size.height;
}
- (void)setYj_height:(CGFloat)yj_height
{
    CGRect frame = self.frame;
    frame.size.height = yj_height;
    self.frame = frame;
}

- (CGFloat)yj_x
{
    return self.frame.origin.x;
}
- (void)setYj_x:(CGFloat)yj_x
{
    CGRect frame = self.frame;
    frame.origin.x = yj_x;
    self.frame = frame;
}

- (CGFloat)yj_y
{
    return self.frame.origin.y;
}
- (void)setYj_y:(CGFloat)yj_y
{
    CGRect frame = self.frame;
    frame.origin.y = yj_y;
    self.frame = frame;
}

- (CGFloat)yj_centerX
{
    return self.center.x;
}

- (void)setYj_centerX:(CGFloat)yj_centerX
{
    CGPoint point = self.center;
    point.x = yj_centerX;
    self.center = point;
}

- (CGFloat)yj_centerY{
    return self.center.y;
}

- (void)setYj_centerY:(CGFloat)yj_centerY
{
    CGPoint point = self.center;
    point.y = yj_centerY;
    self.center = point;

}









@end

