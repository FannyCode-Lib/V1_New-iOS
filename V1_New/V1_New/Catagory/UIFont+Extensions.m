//
//  UIFont+Extensions.m
//  V1_New
//
//  Created by Andy on 2020/1/14.
//  Copyright © 2020 Andy. All rights reserved.
//

#import "UIFont+Extensions.h"

@implementation UIFont (Extensions)

+ (UIFont *)fontWithString:(NSString *)name fontSize:(CGFloat)fontSize{
    UIFont *font = [UIFont fontWithName:name size:fontSize];
    if (!font) {
        font = [UIFont systemFontOfSize:fontSize];
    }
    return font;
}

+ (UIFont *)fontPingFangSCLight:(CGFloat)fontSize {
    return [self fontWithString:@"PingFangSC-Light" fontSize:fontSize];
}

+ (UIFont *)fontPingFangSCRegular:(CGFloat)fontSize {
    return [self fontWithString:@"PingFangSC-Regular" fontSize:fontSize];
}

+ (UIFont *)fontPingFangSCMedium:(CGFloat)fontSize {
    return [self fontWithString:@"PingFangSC-Medium" fontSize:fontSize];
}

+ (UIFont *)fontPingFangSCSemibold:(CGFloat)fontSize {
    return [self fontWithString:@"PingFangSC-Semibold" fontSize:fontSize];
}

@end
