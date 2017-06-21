//
//  JQRefreshHeaader.m
//  XRHBanTangHomeDemo
//
//  Created by xiangronghua on 2017/6/21.
//  Copyright © 2017年 xiangronghua. All rights reserved.
//

#import "JQRefreshHeaader.h"

@interface JQRefreshHeaader ()

@property (strong, nonatomic) UIImageView *refreshImageView;
@property (strong, nonatomic) NSMutableArray *imageViews;

@end

@implementation JQRefreshHeaader

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self addSubview:self.refreshImageView];
    }
    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    
    [super willMoveToSuperview:newSuperview];
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    [self.tableView addObserver:self forKeyPath:@"contentOffset" options:options context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    if (![keyPath isEqualToString:@"contentOffset"]) {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        return;
    }
    
    UITableView *tableView = (UITableView *)object;
    CGFloat tableViewOffsetY = tableView.contentOffset.y;
    
    if (tableViewOffsetY <= 0 && tableViewOffsetY > -35) {
        
        [self hideAllImageView];
    } else if (tableViewOffsetY < -35){
        
        if (tableViewOffsetY < -59) {
            
            [self showAllImageView];
        } else {
            
            CGFloat offset = fabs(tableViewOffsetY) - 35;
            NSInteger imageCount = offset / 2.0f;//两个偏移量切换一张图片
            [self hideImageViewExcept:imageCount];
        }
    } else if (tableViewOffsetY < 136) {
        
    }
}


- (void)showAllImageView {
    
    for (int i = 0; i < self.imageViews.count; i++) {
        UIImageView *imageView = [self.imageViews objectAtIndex:i];
        imageView.hidden = NO;
    }
}

- (void)hideAllImageView {
    for (int i = 0; i < self.imageViews.count; i++) {
        UIImageView *imageView = [self.imageViews objectAtIndex:i];
        imageView.hidden = YES;
    }
}

//隐藏其他图片除了当前的图片
- (void)hideImageViewExcept:(NSInteger)index {
    
    if (index >= [self.imageViews count]) {
        return;
    }
    
    for (int i = 0; i < self.imageViews.count; i++) {
        UIImageView *imageView = [self.imageViews objectAtIndex:i];
        if (i == index) {
            imageView.hidden = NO;
        } else {
            imageView.hidden = YES;
        }
    }
}

- (NSMutableArray *)imageViews {
    
    if (!_imageViews) {
        _imageViews = [[NSMutableArray alloc] init];
        for (int i = 1; i < 11; i++) {
            NSString *imageUrl = [NSString stringWithFormat:@"header%02d%@",i,@"@2x.jpg"];
            UIImage *image = [UIImage imageNamed:imageUrl];
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
            imageView.image = image;
            imageView.hidden = YES;
            [_imageViews addObject:imageView];
            [self addSubview:imageView];
        }
    }
    return  _imageViews;
}

@end
