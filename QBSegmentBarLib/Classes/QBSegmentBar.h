//
//  QBSegmentBar.h
//  QBSegmentBar
//
//  Created by cqb on 17/3/17.
//  Copyright © 2017年 cqb. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QBSegmentBarConfig,QBSegmentBar;

/**
 点击segmentBar上item的回调协议
 */
@protocol QBSegmentBarDelegate <NSObject>

@optional

- (void)segmentBar:(QBSegmentBar *)segmentBar didSelectItemFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex;

@end

@interface QBSegmentBar : UIView


/**
 QBSegmentBar初始化方法

 @param frame 当前的frame
 @return QBSegmentBar对象
 */
+ (instancetype)segmentBarWithFrame:(CGRect)frame;


/**
 更新config的block

 @param configBlock 外部设置config的block
 */
- (void)upDateSegmentBarWithConfigBlock:(void(^)(QBSegmentBarConfig *config))configBlock;

/*
 数据源
 */
@property (nonatomic,strong)NSMutableArray <NSString *> *dataArray;


/**
 当前选中的index索引
 */
@property (nonatomic,assign)NSInteger selectedIndex;


/**
  点击segmentBar上item的回调代理
 */
@property (nonatomic,weak)id<QBSegmentBarDelegate>delegate;

@end
