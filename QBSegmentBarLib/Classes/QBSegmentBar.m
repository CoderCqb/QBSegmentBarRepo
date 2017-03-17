//
//  QBSegmentBar.m
//  QBSegmentBar
//
//  Created by cqb on 17/3/17.
//  Copyright © 2017年 cqb. All rights reserved.
//

#import "QBSegmentBar.h"
#import "QBSegmentBarConfig.h"
#import "UIView+QBFrameView.h"

static CGFloat const minMargin = 16.0f;
static CGFloat const duration = 0.2f;
@interface QBSegmentBar ()
{
    UIButton *_currentBtn;
}

@property (nonatomic ,strong)QBSegmentBarConfig *config;

@property (nonatomic,weak)UIScrollView *contentScroll;

@property (nonatomic,weak)UIView *indicatorView;

@property (nonatomic ,strong)NSMutableArray <UIButton *> *btnDataArray;


@end

@implementation QBSegmentBar


- (QBSegmentBarConfig *)config {
    
    if (!_config) {
        
        _config = [QBSegmentBarConfig defaultSegmentBarConfig];
        
    }
    return _config;
}

- (UIScrollView *)contentScroll {
    
    if (!_contentScroll) {
        
        UIScrollView *scroll = [[UIScrollView alloc]init];
        scroll.scrollEnabled = self.config.canScroll;
        scroll.showsVerticalScrollIndicator = NO;
        scroll.showsHorizontalScrollIndicator = NO;
        scroll.bounces = NO;
        [self addSubview:scroll];
        _contentScroll = scroll;
    }
    return _contentScroll;
}

- (UIView *)indicatorView {
    
    if (!_indicatorView) {
        
        UIView *view = [[UIView alloc]init];
        view.backgroundColor = self.config.indicatorBackgroundColor;
        [self.contentScroll addSubview:view];
        _indicatorView = view;
    }
    return _indicatorView;
}

- (NSMutableArray*)btnDataArray {
    
    if (!_btnDataArray) {
        
        _btnDataArray = [NSMutableArray array];
    }
    
    return _btnDataArray;
}

+ (instancetype)segmentBarWithFrame:(CGRect)frame {
    
    QBSegmentBar *seg = [[QBSegmentBar alloc]initWithFrame:frame];
    return seg;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = self.config.segmentBarBackgroundColor;
        
    }
    return self;
}

- (void)setDataArray:(NSMutableArray<NSString *> *)dataArray {
 
  if (dataArray.count == 0 || [dataArray isEqualToArray:_dataArray]) return;
    
    [self.btnDataArray makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.btnDataArray = nil;

    _dataArray = dataArray;
    
    for (NSString *title in dataArray) {
        
     UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
     [btn setTitle:title forState:UIControlStateNormal];
     [btn setTitleColor:self.config.titleNormalColor forState:UIControlStateNormal];
     [btn setTitleColor:self.config.titleSelectedColor forState:UIControlStateSelected];
     btn.tag = self.btnDataArray.count;
     btn.titleLabel.font = self.config.titleFont;
     [btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
     [self.contentScroll addSubview:btn];
     [self.btnDataArray addObject:btn];
        
    }
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
}


- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    self.contentScroll.frame = self.bounds;
    
    CGFloat totalBtnWidth = 0;
    for (UIButton *btn in self.btnDataArray) {
        
        [btn sizeToFit];
        totalBtnWidth += btn.QB_width;
    }
    
    CGFloat margin = (self.contentScroll.QB_width - totalBtnWidth) / (self.btnDataArray.count +1);
    
    if (margin < minMargin) margin = minMargin;
    
    CGFloat lastDistance = margin;
    for (UIButton *btn in self.btnDataArray) {
        
        btn.QB_y = 0;
        btn.QB_x = lastDistance;
        lastDistance += btn.QB_width + margin;
    }
    
    
    self.contentScroll.contentSize = CGSizeMake(lastDistance, 0);
    
    if (self.dataArray.count == 0) return;
    
    UIButton *currentBtn = self.btnDataArray[self.selectedIndex];
    self.indicatorView.QB_width = currentBtn.QB_width + self.config.indicatorExtraWidth;
    self.indicatorView.QB_height = self.config.indicatorHeight;
    self.indicatorView.QB_x = currentBtn.QB_x;
    self.indicatorView.QB_y = self.contentScroll.QB_height - self.indicatorView.QB_height;

}

- (void)setSelectedIndex:(NSInteger)selectedIndex {
    
    if (selectedIndex < 0 || selectedIndex > self.btnDataArray.count -1 || self.btnDataArray.count == 0) return;
    
    _selectedIndex = selectedIndex;
    
    UIButton *btn = self.btnDataArray[selectedIndex];
    [self pressBtn:btn];
}


- (void)pressBtn:(UIButton *)btn {
    
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(segmentBar:didSelectItemFromIndex:toIndex:)]) {
        
        [self.delegate segmentBar:self didSelectItemFromIndex:_currentBtn.tag toIndex:btn.tag];
    }
    
    _currentBtn.selected = NO;
    btn.selected = YES;
    _currentBtn = btn;
    
    _selectedIndex = btn.tag;
    
    [UIView animateWithDuration:duration animations:^{
        
        self.indicatorView.QB_width = btn.QB_width + self.config.indicatorExtraWidth;
        self.indicatorView.QB_centerX = btn.QB_centerX;
        
    }];
    
    
    CGFloat barCenterWidth = self.QB_width *0.5;
    CGFloat scrollOffset = btn.QB_centerX - barCenterWidth;
    if (scrollOffset < 0) scrollOffset = 0;
    
    if (scrollOffset > self.contentScroll.contentSize.width - self.QB_width) {
        
        scrollOffset = self.contentScroll.contentSize.width - self.QB_width;
    }
        
    [self.contentScroll setContentOffset:CGPointMake(scrollOffset, 0) animated:YES];
}


- (void)upDateSegmentBarWithConfigBlock:(void (^)(QBSegmentBarConfig *))configBlock {
    
    if (configBlock) {
        configBlock(self.config);
    }
    
    [self updateSegmentBar];
}

- (void)updateSegmentBar {
    
    self.backgroundColor = self.config.segmentBarBackgroundColor;
    self.contentScroll.scrollEnabled = self.config.canScroll;
    self.indicatorView.backgroundColor = self.config.indicatorBackgroundColor;
    for (UIButton *btn in self.btnDataArray) {
        [btn setTitleColor:self.config.titleNormalColor forState:UIControlStateNormal];
        [btn setTitleColor:self.config.titleSelectedColor forState:UIControlStateSelected];
        btn.titleLabel.font = self.config.titleFont;
    }
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

@end
