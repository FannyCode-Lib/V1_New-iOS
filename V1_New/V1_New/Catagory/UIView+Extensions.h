//
//  UIView+Extensions.h
//  IM
//
//  Created by Andy on 2017/9/5.
//  Copyright © 2017年 Linxun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extensions)

@property (nonatomic, assign) CGFloat lx_left;
@property (nonatomic, assign) CGFloat lx_top;

@property (nonatomic,assign) CGFloat lx_width;
@property (nonatomic,assign) CGFloat lx_height;

@property (nonatomic,assign) CGFloat lx_right;
@property (nonatomic,assign) CGFloat lx_bottom;

@property (nonatomic,assign) CGPoint lx_origin;
@property (nonatomic,assign) CGSize lx_size;

@property (nonatomic,assign) CGFloat lx_centerX;
@property (nonatomic,assign) CGFloat lx_centerY;

- (void)removeAllSubViews;

@end
