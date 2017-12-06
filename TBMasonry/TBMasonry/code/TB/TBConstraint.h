//
//  TBConstraint.h
//  TBCoreData8
//
//  Created by hanchuangkeji on 2017/12/5.
//  Copyright © 2017年 hanchuangkeji. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/NSLayoutConstraint.h>

@class TBConstraint;
@protocol TBConstraintDelegate<NSObject>

@optional
- (void)equalToCalled:(id)value;

- (void)offsetCalled:(CGFloat)value;

- (void)addTBConstraintCalled:(TBConstraint *)constraint;

@end

@interface TBConstraint : NSObject


- (TBConstraint *)top;

- (TBConstraint *)left;

- (TBConstraint *)bottom;

- (TBConstraint *)right;

- (TBConstraint *)width;

- (TBConstraint *)height;

- (TBConstraint *(^)(id))equalTo;

- (TBConstraint *(^)(CGFloat))offset;

@property (nonatomic, assign, readonly)NSLayoutAttribute layoutAttribute;

@property (nonatomic, weak, readonly)id<TBConstraintDelegate> delegate;

- (instancetype)initWithAttribute:(NSLayoutAttribute)layoutAttribute delegate:(id<TBConstraintDelegate>)delegate;


@end
