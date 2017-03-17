//
//  UIView+QBFrameView.m
//  QBFMMain
//
//  Created by cqb on 17/3/13.
//  Copyright © 2017年 cqb. All rights reserved.
//

#import "UIView+QBFrameView.h"

@implementation UIView (QBFrameView)

- (void)setQB_x:(CGFloat)QB_x {
    
    CGRect frame = self.frame;
    frame.origin.x = QB_x;
    self.frame = frame;
}

- (CGFloat)QB_x {
    
    return self.frame.origin.x;
}

- (void)setQB_y:(CGFloat)QB_y {
    
    CGRect frame = self.frame;
    frame.origin.y = QB_y;
    self.frame = frame;
}

- (CGFloat)QB_y {
    
    return self.frame.origin.y;
}

- (void)setQB_width:(CGFloat)QB_width {
    
    CGRect frame = self.frame;
    frame.size.width = QB_width;
    self.frame = frame;
}

- (CGFloat)QB_width {
    
    return self.frame.size.width;
}


- (void)setQB_height:(CGFloat)QB_height {
    
    CGRect frame = self.frame;
    frame.size.height = QB_height;
    self.frame = frame;
}

- (CGFloat)QB_height  {
    
    return self.frame.size.height;
}

- (void)setQB_centerX:(CGFloat)QB_centerX {
    
    CGPoint center = self.center;
    center.x = QB_centerX;
    self.center = center;
}

- (CGFloat)QB_centerX {
    
    return self.center.x;
}


- (void)setQB_centerY:(CGFloat)QB_centerY {
    
    CGPoint center = self.center;
    center.x = QB_centerY;
    self.center = center;
    
}

- (CGFloat)QB_centerY {
    
    return self.center.y;
}

- (void)setQB_center:(CGPoint)QB_center {
    
    CGPoint center = self.center;
    center = QB_center;
    self.center = center;
}

- (CGPoint)QB_center {
    
    return self.center;
}


+ (instancetype)loadNibView {
    
    return  [[NSBundle bundleForClass:[self class]] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].lastObject;
}


@end
