//
//  UIColor+Extension.h
//  V1_New
//
//  Created by Andy on 2020/1/12.
//  Copyright © 2020 Andy. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface UIColor (Extension)

/*使用16进制数字创建颜色，例如 0xFF0000 创建红色
 *@param hex 16进制无符号32位整数
 *@return 颜色
 **/
+ (instancetype)colorWithHex:(uint32_t)hex;

+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;

/*颜色转成图片
 *@param color 颜色
 *@return 图片
 **/
+ (UIImage *)imageWithColor:(UIColor *)color;

+ (instancetype)colorWithRed:(uint8_t)red green:(uint8_t)green blue:(uint8_t)blue;

@end


