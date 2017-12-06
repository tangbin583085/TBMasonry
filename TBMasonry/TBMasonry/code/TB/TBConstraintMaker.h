//
//  TBConstraintMaker.h
//  TBCoreData8
//
//  Created by hanchuangkeji on 2017/12/4.
//  Copyright © 2017年 hanchuangkeji. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TBConstraint.h"

@interface TBConstraintMaker : NSObject

@property (nonatomic, copy)TBConstraint *top;
@property (nonatomic, copy)TBConstraint *left;
@property (nonatomic, copy)TBConstraint *bottom;
@property (nonatomic, copy)TBConstraint *right;
@property (nonatomic, copy)TBConstraint *height;
@property (nonatomic, copy)TBConstraint *width;

@property (nonatomic, copy)TBConstraint *center;
@property (nonatomic, copy)TBConstraint *centerX;
@property (nonatomic, copy)TBConstraint *centerY;

@property (nonatomic, copy)TBConstraint *size;
@property (nonatomic, copy)TBConstraint *point;

// view
@property (nonatomic, weak)UIView *sourceView;

// 创建或者更新
@property (nonatomic, assign)BOOL updateConstraint;

// 移除所有的约束
- (void)removeAllConstraint;


@end
