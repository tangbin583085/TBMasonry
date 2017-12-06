//
//  UIView+MakeConstrain.m
//  TBCoreData8
//
//  Created by hanchuangkeji on 2017/12/4.
//  Copyright © 2017年 hanchuangkeji. All rights reserved.
//

#import "UIView+MakeConstrain.h"
#import <objc/runtime.h>


static const char TBMakerKey = '\0';

@implementation UIView (MakeConstrain)

- (void)setMaker:(TBConstraintMaker *)maker {
    
    
    
    
}

- (TBConstraintMaker *)maker {
    TBConstraintMaker *maker = objc_getAssociatedObject(self, &TBMakerKey);
    if (maker == nil) {
        TBConstraintMaker *makerTemp = [[TBConstraintMaker alloc] init];
        objc_setAssociatedObject(self, &TBMakerKey,
                                 makerTemp, OBJC_ASSOCIATION_RETAIN);
        makerTemp.sourceView = self;
        maker = makerTemp;
    }
    return maker;
}

- (void)tb_makeConstraints:(void(^)(TBConstraintMaker *make))block {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    
    // 执行block
    if (block) {
        
        // 创建或者更新
        self.maker.updateConstraint = NO;
        block(self.maker);
    }
}


- (void)tb_updateConstraints:(void(^)(TBConstraintMaker *make))block {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    
    // 执行block
    if (block) {
        
        // 创建或者更新
        self.maker.updateConstraint = YES;
        block(self.maker);
    }
}


- (void)tb_remakeConstraints:(void(^)(TBConstraintMaker *make))block {
    
    // 执行block
    if (block) {
        
        // 移除所有约束
        [self.maker removeAllConstraint];
        self.maker = nil;
        
        block(self.maker);
    }
    
}


// top, left, bottom, right
- (TBViewAttribute *)tb_top {
    return [[TBViewAttribute alloc] initWithAttribute:NSLayoutAttributeTop view:self];
}

- (TBViewAttribute *)tb_left {
    return [[TBViewAttribute alloc] initWithAttribute:NSLayoutAttributeLeft view:self];
}

- (TBViewAttribute *)tb_bottom {
    return [[TBViewAttribute alloc] initWithAttribute:NSLayoutAttributeBottom view:self];
}

- (TBViewAttribute *)tb_right {
    return [[TBViewAttribute alloc] initWithAttribute:NSLayoutAttributeRight view:self];
}


@end
