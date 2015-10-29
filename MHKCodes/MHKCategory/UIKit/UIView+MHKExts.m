//
//  UIView+MHKExts.m
//  MHKCodes
//
//  Created by heke on 15/10/29.
//  Copyright (c) 2015年 mhk. All rights reserved.
//

#import "UIView+MHKExts.h"

@implementation UIView (MHKExts)

- (CGPoint)topLeft{
    return self.frame.origin;
}

- (void)setTopLeft:(CGPoint)topLeft{
    CGRect rt = self.frame;
    rt.origin = topLeft;
    self.frame = rt;
}

- (CGPoint)topRight{
    CGPoint tl = self.topLeft;
    tl.x += self.width;
    return tl;
}

- (void)setTopRight:(CGPoint)topRight {
    CGRect rt = self.frame;
    rt.origin.y = topRight.y;
    rt.size.width = topRight.x - rt.origin.x;
    self.frame = rt;
}

- (CGPoint)bottomLeft{
    CGPoint tl = self.topLeft;
    tl.y += self.height;
    return tl;
}

- (void)setBottomLeft:(CGPoint)bottomLeft {
    self.height = bottomLeft.y - self.bottomLeft.y;
}

- (CGPoint)bottomRight{
    return CGPointMake(self.topRight.x, self.bottomLeft.y);
}

- (void)setBottomRight:(CGPoint)bottomRight {
    self.width = bottomRight.x - self.topRight.x;
    self.height = bottomRight.y - self.bottomRight.y;
}

- (CGFloat)width{
    return self.bounds.size.width;
}

- (void)setWidth:(CGFloat)width {
    CGRect rt = self.frame;
    rt.size.width = width;
    self.frame = rt;
}

- (CGFloat)height{
    return self.bounds.size.height;
}

- (void)setHeight:(CGFloat)height {
    CGRect rt = self.frame;
    rt.size.height = height;
    self.frame = rt;
}

@end
