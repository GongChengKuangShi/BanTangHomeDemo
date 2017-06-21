//
//  JSDTableViewController.h
//  XRHBanTangHomeDemo
//
//  Created by xiangronghua on 2017/6/20.
//  Copyright © 2017年 xiangronghua. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SCREEN_HEIGHT                      [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH                       [UIScreen mainScreen].bounds.size.width
#define SCALE_6                                                   (SCREEN_WIDTH / 375)

@interface JSDTableViewController : UIViewController

@property (strong, nonatomic) UITableView *tableView;

@end
