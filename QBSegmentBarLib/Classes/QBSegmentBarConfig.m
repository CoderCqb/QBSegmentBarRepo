//
//  QBSegmentBarConfig.m
//  QBSegmentBar
//
//  Created by cqb on 17/3/17.
//  Copyright © 2017年 cqb. All rights reserved.
//

#import "QBSegmentBarConfig.h"

static CGFloat const indicatorExtraWidth = 2.0f;
static CGFloat const indicatorHeight = 3.0f;

@implementation QBSegmentBarConfig

+ (instancetype)defaultSegmentBarConfig {
    
    QBSegmentBarConfig *config = [[QBSegmentBarConfig alloc]init];
    
    config.segmentBarBackgroundColor = [UIColor whiteColor];
    config.titleNormalColor = [UIColor blackColor];
    config.titleSelectedColor = [UIColor redColor];
    config.titleFont = [UIFont systemFontOfSize:18];
    config.indicatorBackgroundColor = [UIColor redColor];
    config.indicatorExtraWidth = indicatorExtraWidth;
    config.indicatorHeight = indicatorHeight;
    config.canScroll = YES;
    
    return config;
}


@end
