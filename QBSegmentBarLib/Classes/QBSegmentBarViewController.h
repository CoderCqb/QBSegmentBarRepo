//
//  QBSegmentBarViewController.h
//  QBSegmentBar
//
//  Created by cqb on 17/3/17.
//  Copyright © 2017年 cqb. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QBSegmentBar;
@interface QBSegmentBarViewController : UIViewController

@property (nonatomic,weak)QBSegmentBar *segmentBar;

@property (nonatomic,weak)UIScrollView *contentScroll;

- (void)addChildVCArray:(NSArray *)childVCArray titlesArray:(NSArray *)titleArray;

@end
