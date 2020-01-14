//
//  UIView+Extensions.m
//  IM
//
//  Created by Andy on 2017/9/5.
//  Copyright © 2017年 Linxun. All rights reserved.
//

@implementation UIView (Extensions)

- (void)removeAllSubViews
{
    for (id view in self.subviews) {
        [view removeFromSuperview];
    }
}

- (CGFloat)lx_left
{
    return self.frame.origin.x;
}

- (void)setLx_left:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)lx_top
{
    return self.frame.origin.y;
}

- (void)setLx_top:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

#pragma mark - Shortcuts for the coords

- (CGFloat)lx_right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setLx_right:(CGFloat)right
{
    CGRect frame = self.frame;
    frame.origin.x = right - self.frame.size.width;
    self.frame = frame;
}

- (CGFloat)lx_bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setLx_bottom:(CGFloat)bottom
{
    CGRect frame = self.frame;
    frame.origin.y = bottom - self.frame.size.height;
    self.frame = frame;
}

- (CGFloat)lx_width
{
    return self.frame.size.width;
}

- (void)setLx_width:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)lx_height
{
    return self.frame.size.height;
}

- (void)setLx_height:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

#pragma mark - Shortcuts for frame properties
- (CGPoint)lx_origin {
    return self.frame.origin;
}

- (void)setLx_origin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)lx_size {
    return self.frame.size;
}

- (void)setLx_size:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

#pragma mark - Shortcuts for positions
- (CGFloat)lx_centerX {
    return self.center.x;
}

- (void)setLx_centerX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)lx_centerY {
    return self.center.y;
}

- (void)setLx_centerY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

@end
