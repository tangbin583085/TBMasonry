//
//  UIScrollView+TBAdditions.m
//  TBCoreData8
//
//  Created by hanchuangkeji on 2017/12/5.
//  Copyright © 2017年 hanchuangkeji. All rights reserved.
//

#import "NSArray+TBAdditions.h"
#import "UIView+MakeConstrain.h"

@implementation NSArray (TBAdditions)


- (NSArray *)tb_makeConstraints:(void (NS_NOESCAPE ^)(TBConstraintMaker *make))block {
    
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        UIView *view = obj;
        [view tb_makeConstraints:block];
    }];
    return self;
}


- (NSArray *)tb_updateConstraints:(void (NS_NOESCAPE ^)(TBConstraintMaker *make))block {
    
    
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        UIView *view = obj;
        [view tb_updateConstraints:block];
    }];
    
    return self;
}


- (NSArray *)tb_remakeConstraints:(void (NS_NOESCAPE ^)(TBConstraintMaker *make))block {
    
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        UIView *view = obj;
        [view tb_remakeConstraints:block];
    }];
    
    return self;
}


- (void)tb_distributeViewsAlongAxis:(TBAxisType)axisType withFixedSpacing:(CGFloat)fixedSpacing leadSpacing:(CGFloat)leadSpacing tailSpacing:(CGFloat)tailSpacing {
    
    
    
}


- (void)tb_distributeViewsAlongAxis:(TBAxisType)axisType withFixedItemLength:(CGFloat)fixedItemLength leadSpacing:(CGFloat)leadSpacing tailSpacing:(CGFloat)tailSpacing {
    
}

@end
