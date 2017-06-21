//
//  JSDTHomeRecomandModel.h
//  XRHBanTangHomeDemo
//
//  Created by xiangronghua on 2017/6/20.
//  Copyright © 2017年 xiangronghua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JSDTHomeRecomandModel : NSObject

@property (nonatomic, strong) UIImage *placeholderImage;
@property (nonatomic, copy) NSString *picUrl;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *views;
@property (nonatomic, copy) NSString *likes;

@end
