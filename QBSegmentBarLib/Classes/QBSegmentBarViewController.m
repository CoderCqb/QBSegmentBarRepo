//
//  QBSegmentBarViewController.m
//  QBSegmentBar
//
//  Created by cqb on 17/3/17.
//  Copyright © 2017年 cqb. All rights reserved.
//

#import "QBSegmentBarViewController.h"
#import "UIView+QBFrameView.h"
#import "QBSegmentBar.h"
#define kScreenHeight [UIScreen mainScreen].bounds.size.width
@interface QBSegmentBarViewController ()<QBSegmentBarDelegate,UIScrollViewDelegate>



@end

@implementation QBSegmentBarViewController

- (QBSegmentBar *)segmentBar {
    
    if (!_segmentBar) {
        
        QBSegmentBar *seg = [QBSegmentBar segmentBarWithFrame:CGRectZero];
        seg.delegate = self;
        [self.view addSubview:seg];
        _segmentBar = seg;
        
    }
    return _segmentBar;
}

- (UIScrollView *)contentScroll {
    
    if (!_contentScroll) {
        
        UIScrollView *scroll = [[UIScrollView alloc]init];
        scroll.showsVerticalScrollIndicator = NO;
        scroll.showsHorizontalScrollIndicator = NO;
        scroll.bounces = NO;
        scroll.delegate = self;
        scroll.pagingEnabled = YES;
        [self.view addSubview:scroll];
        _contentScroll = scroll;
        
    }
    return _contentScroll;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
   self.automaticallyAdjustsScrollViewInsets = NO;

}



- (void)addChildVCArray:(NSArray *)childVCArray titlesArray:(NSArray *)titleArray {
    
    if (childVCArray.count == 0 || titleArray.count == 0 || childVCArray.count != titleArray.count) return;
    
    
    [self.childViewControllers makeObjectsPerformSelector:@selector(removeFromParentViewController)];
    
    for (UIViewController *childVC in childVCArray) {
        
        [self addChildViewController:childVC];
    }
    
    self.contentScroll.contentSize = CGSizeMake(childVCArray.count *self.contentScroll.QB_width, 0);
    
    self.segmentBar.dataArray = [titleArray mutableCopy];
    
    self.segmentBar.selectedIndex = 0;
    
    
}

- (void)segmentBar:(QBSegmentBar *)segmentBar didSelectItemFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex {
 
    UIViewController *newVC = self.childViewControllers[toIndex];
    newVC.view.frame = CGRectMake(toIndex *self.contentScroll.QB_width, 0, self.contentScroll.QB_width, self.contentScroll.QB_height);
    [self.contentScroll addSubview:newVC.view];
    [self.contentScroll setContentOffset:CGPointMake(toIndex *self.contentScroll.QB_width, 0) animated:YES];
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    NSInteger index = scrollView.contentOffset.x / self.contentScroll.QB_width;
    self.segmentBar.selectedIndex = index;
}


@end
