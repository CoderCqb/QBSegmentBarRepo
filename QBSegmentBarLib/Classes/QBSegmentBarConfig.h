//
//  QBSegmentBarConfig.h
//  QBSegmentBar
//
//  Created by cqb on 17/3/17.
//  Copyright © 2017年 cqb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface QBSegmentBarConfig : NSObject

/*segmentBar背景色*/
@property (nonatomic,strong)UIColor *segmentBarBackgroundColor;

/*title的普通文字颜色*/
@property (nonatomic ,strong)UIColor *titleNormalColor;

/*title选中的文字颜色*/
@property (nonatomic ,strong)UIColor *titleSelectedColor;

/*title字体大小*/
@property (nonatomic ,strong)UIFont *titleFont;

/*指示器背景色*/
@property (nonatomic ,strong)UIColor *indicatorBackgroundColor;

/*指示器额外扩展宽度*/
@property (nonatomic,assign)CGFloat indicatorExtraWidth;

/*指示器额外扩展高度*/
@property (nonatomic,assign)CGFloat indicatorHeight;

/*SegmentBar是否可以滚动*/
@property (nonatomic,assign,getter=isCanScroll)BOOL canScroll;

+ (instancetype)defaultSegmentBarConfig;

@end
