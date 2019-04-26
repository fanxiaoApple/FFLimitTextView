//
//  UIView+FFAdd.m
//  FFKit_Example
//
//  Created by 肖凡 on 2019/3/21.
//  Copyright © 2019年 fanxiaoApple. All rights reserved.
//

#import "UIView+FFAdd.h"

@implementation UIView (FFAdd)
-(CGFloat)FF_Top{
    return self.frame.origin.y;
}
- (void)setFF_Top:(CGFloat)FF_Top{
    CGRect frame = self.frame;
    frame.origin.y = FF_Top;
    self.frame = frame;
}

-(CGFloat)FF_Left{
    return self.frame.origin.x;
}
-(void)setFF_Left:(CGFloat)FF_Left{
    CGRect frame = self.frame;
    frame.origin.x = FF_Left;
    self.frame = frame;
}

-(CGFloat)FF_Bottom{
    return self.frame.origin.y + self.frame.size.height;
}
-(void)setFF_Bottom:(CGFloat)FF_Bottom{
    CGRect frame = self.frame;
    frame.origin.y = FF_Bottom - frame.size.height;
    self.frame = frame;
}

-(CGFloat)FF_Right{
    return self.frame.origin.x + self.frame.size.width;
}
- (void)setFF_Right:(CGFloat)FF_Right{
    CGRect frame = self.frame;
    frame.origin.x = FF_Right - frame.size.width;
    self.frame = frame;
}

-(CGFloat)FF_Width{
    return self.frame.size.width;
}
-(void)setFF_Width:(CGFloat)FF_Width{
    CGRect frame = self.frame;
    frame.size.width = FF_Width;
    self.frame = frame;
}

-(CGFloat)FF_Height{
    return self.frame.size.height;
}
-(void)setFF_Height:(CGFloat)FF_Height{
    CGRect frame = self.frame;
    frame.size.height = FF_Height;
    self.frame = frame;
}

-(CGFloat)FF_CenterX{
    return self.center.x;
}
- (void)setFF_CenterX:(CGFloat)FF_CenterX{
    self.center = CGPointMake(FF_CenterX, self.center.y);
}

- (CGFloat)FF_CenterY{
    return self.center.y;
}
-(void)setFF_CenterY:(CGFloat)FF_CenterY{
    self.center = CGPointMake(self.center.x, FF_CenterY);
}

-(CGPoint)FF_Origin{
    return self.frame.origin;
}
-(void)setFF_Origin:(CGPoint)FF_Origin{
    CGRect frame = self.frame;
    frame.origin = FF_Origin;
    self.frame = frame;
}

-(CGSize)FF_Size{
    return self.frame.size;
}
-(void)setFF_Size:(CGSize)FF_Size{
    CGRect frame = self.frame;
    frame.size = FF_Size;
    self.frame = frame;
}

@end
