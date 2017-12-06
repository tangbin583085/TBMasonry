//
//  UIScrollView+TBAdditions.h
//  TBCoreData8
//
//  Created by hanchuangkeji on 2017/12/5.
//  Copyright © 2017年 hanchuangkeji. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TBConstraintMaker.h"

typedef NS_ENUM(NSUInteger, TBAxisType) {
    TBAxisTypeHorizontal,
    TBAxisTypeVertical
};


@interface NSArray (TBAdditions)

- (NSArray *)tb_makeConstraints:(void (NS_NOESCAPE ^)(TBConstraintMaker *make))block;


- (NSArray *)tb_updateConstraints:(void (NS_NOESCAPE ^)(TBConstraintMaker *make))block;


- (NSArray *)tb_remakeConstraints:(void (NS_NOESCAPE ^)(TBConstraintMaker *make))block;


- (void)tb_distributeViewsAlongAxis:(TBAxisType)axisType withFixedSpacing:(CGFloat)fixedSpacing leadSpacing:(CGFloat)leadSpacing tailSpacing:(CGFloat)tailSpacing;


- (void)tb_distributeViewsAlongAxis:(TBAxisType)axisType withFixedItemLength:(CGFloat)fixedItemLength leadSpacing:(CGFloat)leadSpacing tailSpacing:(CGFloat)tailSpacing;



@end
