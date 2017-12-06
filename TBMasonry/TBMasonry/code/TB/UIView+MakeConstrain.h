//
//  UIView+MakeConstrain.h
//  TBCoreData8
//
//  Created by hanchuangkeji on 2017/12/4.
//  Copyright © 2017年 hanchuangkeji. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TBConstraintMaker.h"
#import "TBViewAttribute.h"

@interface UIView (MakeConstrain)

@property (nonatomic, strong)TBConstraintMaker *maker;

- (void)tb_makeConstraints:(void(^)(TBConstraintMaker *make))block;

- (void)tb_updateConstraints:(void(^)(TBConstraintMaker *make))block;

- (void)tb_remakeConstraints:(void(^)(TBConstraintMaker *make))block;


// top, left, bottom, right
- (TBViewAttribute *)tb_top;

- (TBViewAttribute *)tb_left;

- (TBViewAttribute *)tb_bottom;

- (TBViewAttribute *)tb_right;


@end
