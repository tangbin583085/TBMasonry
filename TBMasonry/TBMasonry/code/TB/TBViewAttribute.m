//
//  TBViewAttribute.m
//  TBCoreData8
//
//  Created by hanchuangkeji on 2017/12/5.
//  Copyright © 2017年 hanchuangkeji. All rights reserved.
//

#import "TBViewAttribute.h"

@implementation TBViewAttribute

- (instancetype)initWithAttribute:(NSLayoutAttribute)attribute view:(UIView *)view {
    if (self = [super init]) {
        _attribute = attribute;
        _view = view;
    }
    return self;
}

@end
