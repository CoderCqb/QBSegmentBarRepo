//
//  UIView+QBFrameView.h
//  QBFMMain
//
//  Created by cqb on 17/3/13.
//  Copyright © 2017年 cqb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (QBFrameView)

//1:frame 坐标
@property (nonatomic,assign)CGFloat QB_x;
@property (nonatomic,assign)CGFloat QB_y;
@property (nonatomic,assign)CGFloat QB_width;
@property (nonatomic,assign)CGFloat QB_height;
@property (nonatomic,assign)CGFloat QB_centerX;
@property (nonatomic,assign)CGFloat QB_centerY;
@property (nonatomic,assign)CGPoint QB_center;
//2:懒加载xib
+ (instancetype)loadNibView;

@end
