//
//  UIImage+Extensions.m
//  V1_New
//
//  Created by Andy on 2020/1/14.
//  Copyright © 2020 Andy. All rights reserved.
//

#import "UIImage+Extensions.h"

@implementation UIImage (Extensions)

+ (UIImage *)lx_imageWithColor:(UIColor *)color{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *Image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return Image;
}

@end
