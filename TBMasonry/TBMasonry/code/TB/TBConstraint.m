//
//  TBConstraint.m
//  TBCoreData8
//
//  Created by hanchuangkeji on 2017/12/5.
//  Copyright © 2017年 hanchuangkeji. All rights reserved.
//

#import "TBConstraint.h"

@implementation TBConstraint

- (instancetype)initWithAttribute:(NSLayoutAttribute)layoutAttribute delegate:(id<TBConstraintDelegate>)delegate {
    
    if (self = [super init]) {
        _delegate = delegate;
        _layoutAttribute = layoutAttribute;
    }
    return self;
}

#pragma mark <called delegate>
- (void)addConstrainToDelegate:(TBConstraint *)constraint {
    if ([self.delegate respondsToSelector:@selector(addTBConstraintCalled:)]) {
        [self.delegate addTBConstraintCalled:constraint];
    }
}


- (TBConstraint *)top{
    TBConstraint *constrain = [[TBConstraint alloc] initWithAttribute:NSLayoutAttributeTop delegate:self.delegate];
    [self addConstrainToDelegate:constrain];
    return self;
}

- (TBConstraint *)left{
    TBConstraint *constrain = [[TBConstraint alloc] initWithAttribute:NSLayoutAttributeLeft delegate:self.delegate];
    [self addConstrainToDelegate:constrain];
    return self;
}

- (TBConstraint *)bottom{
    TBConstraint *constrain = [[TBConstraint alloc] initWithAttribute:NSLayoutAttributeBottom delegate:self.delegate];
    [self addConstrainToDelegate:constrain];
    return self;
}

- (TBConstraint *)right{
    TBConstraint *constrain = [[TBConstraint alloc] initWithAttribute:NSLayoutAttributeRight delegate:self.delegate];
    [self addConstrainToDelegate:constrain];
    return self;
}

- (TBConstraint *)width{
    TBConstraint *constrain = [[TBConstraint alloc] initWithAttribute:NSLayoutAttributeWidth delegate:self.delegate];
    [self addConstrainToDelegate:constrain];
    return self;
}

- (TBConstraint *)height{
    TBConstraint *constrain = [[TBConstraint alloc] initWithAttribute:NSLayoutAttributeHeight delegate:self.delegate];
    [self addConstrainToDelegate:constrain];
    return self;
}

- (TBConstraint *)size{
    TBConstraint *constrainWidth = [[TBConstraint alloc] initWithAttribute:NSLayoutAttributeWidth delegate:self.delegate];
    [self addConstrainToDelegate:constrainWidth];
    TBConstraint *constrainHeight = [[TBConstraint alloc] initWithAttribute:NSLayoutAttributeHeight delegate:self.delegate];
    [self addConstrainToDelegate:constrainHeight];
    return self;
}

- (TBConstraint *(^)(CGFloat))offset{
    return ^id(CGFloat value) {
        // 执行代理
        if ([self.delegate respondsToSelector:@selector(offsetCalled:)]) {
            [self.delegate offsetCalled:value];
        }
        return self;
    };
}

- (TBConstraint *(^)(id))equalTo{
    return ^id(id value) {
        NSLog(@"%@", value);
        // 执行代理
        if ([self.delegate respondsToSelector:@selector(equalToCalled:)]) {
            [self.delegate equalToCalled:value];
        }
        return self;
    };
}


@end
