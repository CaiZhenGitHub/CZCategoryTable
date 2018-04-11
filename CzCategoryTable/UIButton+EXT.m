//
//  UIButton+EXT.m
//  Cunpiao
//
//  Created by LXH on 2016/11/3.
//  Copyright © 2016年 cwb. All rights reserved.
//

#import "UIButton+EXT.h"
#import <objc/runtime.h>

@interface UIButton (MultiClick)

@property (nonatomic, assign) NSTimeInterval cs_acceptEventInterval; // 重复点击的间隔
@property (nonatomic, assign) NSTimeInterval cs_acceptEventTime;//事件点击的时间

@end

@implementation UIButton (MultiClick)

// 因category不能添加属性，只能通过关联对象的方式。
static const char *UIControl_acceptEventInterval = "UIControl_acceptEventInterval";

- (NSTimeInterval)cs_acceptEventInterval {
    return  [objc_getAssociatedObject(self, UIControl_acceptEventInterval) doubleValue];
}

- (void)setCs_acceptEventInterval:(NSTimeInterval)cs_acceptEventInterval {
    objc_setAssociatedObject(self, UIControl_acceptEventInterval, @(cs_acceptEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

static const char *UIControl_acceptEventTime = "UIControl_acceptEventTime";

- (NSTimeInterval)cs_acceptEventTime {
    return  [objc_getAssociatedObject(self, UIControl_acceptEventTime) doubleValue];
}

- (void)setCs_acceptEventTime:(NSTimeInterval)cs_acceptEventTime {
    objc_setAssociatedObject(self, UIControl_acceptEventTime, @(cs_acceptEventTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

// 在load时执行hook
+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(sendAction:to:forEvent:);
        SEL swizzledSelector = @selector(cs_sendAction:to:forEvent:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL success = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        if (success) {
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}


- (void)cs_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    
//    self.cs_acceptEventInterval = 1;

    if ([NSDate date].timeIntervalSince1970 - self.cs_acceptEventTime < self.cs_acceptEventInterval) {
        return;
    }
    
    if (self.cs_acceptEventInterval > 0) {
        self.cs_acceptEventTime = [NSDate date].timeIntervalSince1970;
    }
    
    [self cs_sendAction:action to:target forEvent:event];
}

@end

@implementation UIButton (EXT)

-(void)setHighlighted:(BOOL)highlighted
{
    
}

/**
 *  设置标题颜色
 *
 *  @param color 颜色
 */
- (void)normalTitleColor:(UIColor*)color
{
    [self setTitleColor:color forState:UIControlStateNormal];
}
- (void)highltTitleColor:(UIColor*)color
{
    [self setTitleColor:color forState:UIControlStateHighlighted];
}
- (void)selectTitleColor:(UIColor*)color
{
    [self setTitleColor:color forState:UIControlStateSelected];
}
/**
 *  设置标题名称
 *
 *  @param title string
 */
- (void)normalTitle:(NSString *)title
{
    [self setTitle:title forState:UIControlStateNormal];
}
- (void)highltTitle:(NSString *)title
{
    [self setTitle:title forState:UIControlStateHighlighted];
}
- (void)selectTitle:(NSString *)title
{
    [self setTitle:title forState:UIControlStateSelected];
}
/**
 *  设置图片
 *
 *  @param imgName image
 */
- (void)normalImage:(NSString *)imgName
{
    [self setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
}
- (void)highltImage:(NSString *)imgName
{
    [self setImage:[UIImage imageNamed:imgName] forState:UIControlStateHighlighted];;
}
- (void)selectImage:(NSString *)imgName
{
    [self setImage:[UIImage imageNamed:imgName] forState:UIControlStateSelected];;
}
-(void)disabledImage:(NSString *)imgName
{
    [self setImage:[UIImage imageNamed:imgName] forState:UIControlStateDisabled];;
}


- (void)normalBackgroundImage:(NSString *)imgName;//正常背景图
{
    [self setBackgroundImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
}
- (void)highltBackgroundImage:(NSString *)imgName;//高亮
{
    [self setBackgroundImage:[UIImage imageNamed:imgName] forState:UIControlStateHighlighted];
}
- (void)selectBackgroundImage:(NSString *)imgName;//选中
{
    [self setBackgroundImage:[UIImage imageNamed:imgName] forState:UIControlStateSelected];
}

-(void)disabledBackgroundImage:(NSString *)imgName
{
    [self setBackgroundImage:[UIImage imageNamed:imgName] forState:UIControlStateDisabled];
}

#pragma mark -- 按钮上图文混排
/**
 *  按钮上的图文混排
 *
 *  @param postion 位置
 *  @param spacing 距离
 */
- (void)setImagePosition:(HHImagePosition)postion spacing:(CGFloat)spacing {
    CGFloat imageWith = self.imageView.image.size.width;
    CGFloat imageHeight = self.imageView.image.size.height;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    CGFloat labelWidth = [self.titleLabel.text sizeWithFont:self.titleLabel.font].width;
    CGFloat labelHeight = [self.titleLabel.text sizeWithFont:self.titleLabel.font].height;
#pragma clang diagnostic pop
    
    CGFloat imageOffsetX = (imageWith + labelWidth) / 2 - imageWith / 2;//image中心移动的x距离
    CGFloat imageOffsetY = imageHeight / 2 + spacing / 2;               //image中心移动的y距离
    CGFloat labelOffsetX = (imageWith + labelWidth / 2) - (imageWith + labelWidth) / 2;//label中心移动的x距离
    CGFloat labelOffsetY = labelHeight / 2 + spacing / 2;//label中心移动的y距离
    
    switch (postion) {
        case HHImagePositionLeft:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, -spacing/2, 0, spacing/2);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, spacing/2, 0, -spacing/2);
            break;
            
        case HHImagePositionRight:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth + spacing/2, 0, -(labelWidth + spacing/2));
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageHeight + spacing/2), 0, imageHeight + spacing/2);
            break;
            
        case HHImagePositionTop:
            self.imageEdgeInsets = UIEdgeInsetsMake(-imageOffsetY, imageOffsetX, imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(labelOffsetY, -labelOffsetX, -labelOffsetY, labelOffsetX);
            break;
            
        case HHImagePositionBottom:
            self.imageEdgeInsets = UIEdgeInsetsMake(imageOffsetY, imageOffsetX, -imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(-labelOffsetY, -labelOffsetX, labelOffsetY, labelOffsetX);
            break;
            
        default:
            break;
    }
}


@end
