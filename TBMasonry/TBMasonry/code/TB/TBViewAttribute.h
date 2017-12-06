//
//  TBViewAttribute.h
//  TBCoreData8
//
//  Created by hanchuangkeji on 2017/12/5.
//  Copyright © 2017年 hanchuangkeji. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/NSLayoutConstraint.h>
#import <UIKit/UIKit.h>


@interface TBViewAttribute : NSObject

@property (nonatomic, weak, readonly)UIView *view;

@property (nonatomic, assign, readonly)NSLayoutAttribute attribute;

- (instancetype)initWithAttribute:(NSLayoutAttribute)attribute view:(UIView *)view;

@end
