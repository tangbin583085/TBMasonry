//
//  TBConstraintMaker.m
//  TBCoreData8
//
//  Created by hanchuangkeji on 2017/12/4.
//  Copyright © 2017年 hanchuangkeji. All rights reserved.
//

#import "TBConstraintMaker.h"
#import "TBViewAttribute.h"

@interface TBConstraintMaker()<TBConstraintDelegate>

@property (nonatomic, strong)NSMutableArray<TBConstraint *> *setAttr;

@property (nonatomic, strong)NSMutableArray<TBConstraint *> *offsetAttr;

@property (nonatomic, strong)NSMutableArray<NSLayoutConstraint *> *relativeLayoutConstraints;// 与自己有关的所有NSLayoutConstraint

@end


@implementation TBConstraintMaker

#pragma mark 懒加载
- (NSMutableArray<NSLayoutConstraint *> *)relativeLayoutConstraints {
    if (_relativeLayoutConstraints == nil) {
        _relativeLayoutConstraints = [NSMutableArray array];
    }
    return _relativeLayoutConstraints;
}

- (NSMutableArray<TBConstraint *> *)setAttr {
    if (_setAttr == nil) {
        _setAttr = [NSMutableArray array];
    }
    return _setAttr;
}

- (NSMutableArray<TBConstraint *> *)offsetAttr {
    if (_offsetAttr == nil) {
        _offsetAttr = [NSMutableArray array];
    }
    return _offsetAttr;
}

- (TBConstraint *)top{
    TBConstraint *constrain = [[TBConstraint alloc] initWithAttribute:NSLayoutAttributeTop delegate:self];
    [self.setAttr addObject:constrain];
    return constrain;
}

- (TBConstraint *)left{
    TBConstraint *constrain = [[TBConstraint alloc] initWithAttribute:NSLayoutAttributeLeft delegate:self];
    [self.setAttr addObject:constrain];
    return constrain;
}

- (TBConstraint *)bottom{
    TBConstraint *constrain = [[TBConstraint alloc] initWithAttribute:NSLayoutAttributeBottom delegate:self];
    [self.setAttr addObject:constrain];
    return constrain;
}

- (TBConstraint *)right{
    TBConstraint *constrain = [[TBConstraint alloc] initWithAttribute:NSLayoutAttributeRight delegate:self];
    [self.setAttr addObject:constrain];
    return constrain;
}

- (TBConstraint *)width{
    TBConstraint *constrain = [[TBConstraint alloc] initWithAttribute:NSLayoutAttributeWidth delegate:self];
    [self.setAttr addObject:constrain];
    return constrain;
}

- (TBConstraint *)height{
    TBConstraint *constrain = [[TBConstraint alloc] initWithAttribute:NSLayoutAttributeHeight delegate:self];
    [self.setAttr addObject:constrain];
    return constrain;
}

- (TBConstraint *)size{
    TBConstraint *constrainWidth = [[TBConstraint alloc] initWithAttribute:NSLayoutAttributeWidth delegate:self];
    [self.setAttr addObject:constrainWidth];
    TBConstraint *constrainHeight = [[TBConstraint alloc] initWithAttribute:NSLayoutAttributeHeight delegate:self];
    [self.setAttr addObject:constrainHeight];
    return constrainHeight;
}

- (void)processSetting:(id)value {
    
    // 常量数字
    if ([value isKindOfClass:[NSNumber class]]) {
        for (int i = 0; i < self.setAttr.count; i++) {
            TBConstraint *constraint = self.setAttr[i];
            CGFloat tempValue = [value floatValue];
            
            // 设置宽高
            if (constraint.layoutAttribute == NSLayoutAttributeWidth || constraint.layoutAttribute == NSLayoutAttributeHeight) {
                
                NSLayoutConstraint *constainLayout = [NSLayoutConstraint constraintWithItem:self.sourceView attribute:constraint.layoutAttribute relatedBy:NSLayoutRelationEqual toItem:nil attribute:kNilOptions multiplier:1.0 constant:tempValue];
                [self.sourceView addConstraint:constainLayout];
                [self.relativeLayoutConstraints addObject:constainLayout];
                
            } else {// 其他的对齐方式
                NSLayoutConstraint *constainLayout = [NSLayoutConstraint constraintWithItem:self.sourceView attribute:constraint.layoutAttribute relatedBy:NSLayoutRelationEqual toItem:self.sourceView.superview attribute:constraint.layoutAttribute multiplier:1.0 constant:tempValue];
                [self.relativeLayoutConstraints addObject:constainLayout];
                [self.sourceView.superview addConstraint:constainLayout];
            }
        }
    }
    
    else if ([value isKindOfClass:[NSValue class]]) {// 结构体CGSize, CGPoint...
        
        NSValue *valueTemp = (NSValue *)value;
        CGPoint point = [valueTemp CGPointValue];
        for (int i = 0; i < self.setAttr.count; i++) {
            CGFloat tempValue = i == 0? point.x : point.y;
            TBConstraint *constraint = self.setAttr[i];
            // 设置宽高
            if (constraint.layoutAttribute == NSLayoutAttributeWidth || constraint.layoutAttribute == NSLayoutAttributeHeight) {
                
                NSLayoutConstraint *constainLayout = [NSLayoutConstraint constraintWithItem:self.sourceView attribute:constraint.layoutAttribute relatedBy:NSLayoutRelationEqual toItem:nil attribute:kNilOptions multiplier:1.0 constant:tempValue];
                [self.sourceView addConstraint:constainLayout];
                [self.relativeLayoutConstraints addObject:constainLayout];
                
            } else {// 其他的对齐方式
                NSLayoutConstraint *constainLayout = [NSLayoutConstraint constraintWithItem:self.sourceView attribute:constraint.layoutAttribute relatedBy:NSLayoutRelationEqual toItem:self.sourceView.superview attribute:constraint.layoutAttribute multiplier:1.0 constant:tempValue];
                [self.relativeLayoutConstraints addObject:constainLayout];
                [self.sourceView.superview addConstraint:constainLayout];
            }
        }
    }
    
    else if ([value isKindOfClass:[UIView class]]) {// 对象UIView
        for (int i = 0; i < self.setAttr.count; i++) {
            
            TBConstraint *constraint = self.setAttr[i];
            UIView *tempView = (UIView *)value;
            
            NSLayoutConstraint *constainLayout = [NSLayoutConstraint constraintWithItem:self.sourceView attribute:constraint.layoutAttribute relatedBy:NSLayoutRelationEqual toItem:tempView attribute:constraint.layoutAttribute multiplier:1.0 constant:0.0];
            [self.relativeLayoutConstraints addObject:constainLayout];
            [self.sourceView.superview addConstraint:constainLayout];
        }
    }
    
    else if ([value isKindOfClass:[TBViewAttribute class]]) {// 对象UIView attribute
        TBViewAttribute *viewAttribute = (TBViewAttribute *)value;
        for (int i = 0; i < self.setAttr.count; i++) {
            TBConstraint *constraint = self.setAttr[i];
            NSLayoutConstraint *constainLayout = [NSLayoutConstraint constraintWithItem:self.sourceView attribute:constraint.layoutAttribute relatedBy:NSLayoutRelationEqual toItem:viewAttribute.view attribute:viewAttribute.attribute multiplier:1.0 constant:0.0];
            [self.relativeLayoutConstraints addObject:constainLayout];
            [self.sourceView.superview addConstraint:constainLayout];
        }
    }
    
    // 供offset使用
    self.offsetAttr = [self.setAttr mutableCopy];
    [self.setAttr removeAllObjects];
}

- (void)tb_removeConstrain:(id)value {
    
    // 移除之前的constraint
    NSMutableArray *removeConstrainArray = [NSMutableArray array];
    for (int i = 0; i < self.setAttr.count; i++) {
        TBConstraint *constraintSource = self.setAttr[i];
        
        for (int j = 0; j < self.relativeLayoutConstraints.count; j++) {
            NSLayoutConstraint *constrain =  self.relativeLayoutConstraints[j];
            if (constraintSource.layoutAttribute == constrain.firstAttribute) {
                NSLog(@"%@", constraintSource);
                
                
                
                if (constrain.firstItem) [constrain.firstItem removeConstraint:constrain];
                if (constrain.secondItem) [constrain.secondItem removeConstraint:constrain];
                [removeConstrainArray addObject:constrain];
            }
        }
    }
    
    [self.relativeLayoutConstraints removeObjectsInArray:removeConstrainArray];
    [self processSetting:value];
}


#pragma mark <TBConstraintDelegate>
-(void)offsetCalled:(CGFloat)value {
    
    // 常量数字
    for (int i = 0; i < self.offsetAttr.count; i++) {
        TBConstraint *constraint = self.offsetAttr[i];
        CGFloat tempValue = value;
        
        for (int j = 0; j < self.relativeLayoutConstraints.count; j++) {
            NSLayoutConstraint *constrain =  self.relativeLayoutConstraints[j];
            if (constraint.layoutAttribute == constrain.firstAttribute) {
                constrain.constant = constrain.constant + tempValue;
                return;
            }
        }
    }
    
}

- (void)equalToCalled:(id)value {
    
    if (self.updateConstraint) {
        [self tb_removeConstrain:value];
    } else {
        [self processSetting:value];
    }
}

- (void)addTBConstraintCalled:(TBConstraint *)constraint {
    [self.setAttr addObject:constraint];
}

#pragma mark <removeAllConstraint>
- (void)removeAllConstraint {
    for (int j = 0; j < self.relativeLayoutConstraints.count; j++) {
        
        NSLayoutConstraint *constrain =  self.relativeLayoutConstraints[j];
        if (constrain.firstItem) [constrain.firstItem removeConstraint:constrain];
        if (constrain.secondItem) [constrain.secondItem removeConstraint:constrain];
    }
    [self.relativeLayoutConstraints removeAllObjects];
}

@end
