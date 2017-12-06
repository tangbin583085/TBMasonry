
//
//  TBMasonryVC.m
//  TBCoreData8
//
//  Created by hanchuangkeji on 2017/12/4.
//  Copyright © 2017年 hanchuangkeji. All rights reserved.
//

#import "TBMasonryVC.h"
#import "UIView+MakeConstrain.h"
#import "Masonry.h"
#import <Foundation/Foundation.h>
#import "NSArray+TBAdditions.h"

@interface TBMasonryVC ()

@end

@implementation TBMasonryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self test3];
}

- (void)test3 {
    UIButton *buton = [UIButton buttonWithType:UIButtonTypeCustom];
    buton.contentEdgeInsets = UIEdgeInsetsMake(10, 20, 30, 40);
    buton.backgroundColor = [UIColor lightGrayColor];
    [buton setTitle:@"惦记我" forState:UIControlStateNormal];
    [self.view addSubview:buton];
    [buton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [buton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@100).offset(11);
        make.left.mas_equalTo(@101);
        make.bottom.equalTo(@-102);
        make.right.equalTo(@-103);
    }];
}

- (void)btnClick:(UIButton *)button {
    button.backgroundColor = [UIColor greenColor];
    [button setTitle:@"惦记我你额是的我而我但是" forState:UIControlStateNormal];
}

- (TBMasonryVC *(^)(void))test6 {
    
    TBMasonryVC *(^myBlock)(void) = ^() {
        NSLog(@"%s", __func__);
        return self;
    };
    return myBlock;
}

//- (TBMasonryVC *(^)(void))test6 {
//
//    TBMasonryVC *(^myBlock)(void) = ^() {
//        NSLog(@"%s", __func__);
//        return self;
//    };
//    return myBlock;
//}

- (instancetype)test7 {
    NSLog(@"%s", __func__);
    return self;
}



- (void)tbMasonry {
    
    UIView *myView = [[UIView alloc] init];
    myView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:myView];
    
    UIView *myView2 = [[UIView alloc] init];
    myView2.backgroundColor = [UIColor blueColor];
    [self.view addSubview:myView2];
    
    UIView *myView3 = [[UIView alloc] init];
    myView3.backgroundColor = [UIColor greenColor];
    [self.view addSubview:myView3];
    
    NSArray *array = @[myView, myView2, myView3];
    //
    [array tb_makeConstraints:^(TBConstraintMaker *make) {
        make.left.equalTo(@20);
        make.top.equalTo(@20);
        make.width.equalTo(@200);
        make.height.equalTo(@200);
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (NSEC_PER_SEC * 2.0)), dispatch_get_main_queue(), ^{
        
        
        [array tb_updateConstraints:^(TBConstraintMaker *make) {
            make.left.equalTo(@40);
        }];
        
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (NSEC_PER_SEC * 4.0)), dispatch_get_main_queue(), ^{
        
        [array tb_remakeConstraints:^(TBConstraintMaker *make) {
            make.left.equalTo(@40);
            make.top.equalTo(@40);
            make.width.equalTo(@100);
            make.height.equalTo(@100);
        }];
        
    });
    
    
    //    NSLog(@"%@", array);
    
    //    for (int i = 0; i < array.count; i++) {
    
    //        if ([array[i] isKindOfClass:[NSSize class]]) {
    //            NSValue *value2 = array[i];
    //            NSLog(@"%@  111");
    //        }
    //    }
    
    //    [myView tb_makeConstraints:^(TBConstraintMaker *make) {
    ////        make.top.left.width.height.equalTo(@20);
    //        make.left.equalTo(@20);
    //        make.top.equalTo(@20);
    //        make.width.equalTo(@20);
    //        make.height.equalTo(@20);
    //    }];
    
    //    [myView tb_makeConstraints:^(TBConstraintMaker *make) {
    ////        make.top.width.left.height.equalTo(self.view);
    ////        make.top.equalTo(self.view);
    ////        make.left.equalTo(self.view);
    ////        make.height.equalTo(self.view);
    ////        make.width.equalTo(self.view);
    //    }];
    
    //    [myView tb_makeConstraints:^(TBConstraintMaker *make) {
    //        make.top.equalTo(self.view).offset(50);
    //        make.left.equalTo(self.view).offset(20);
    ////        make.height.equalTo(@100).offset(30);
    ////        make.width.equalTo(@100);
    //        make.size.equalTo(@(CGSizeMake(100, 100)));
    //    }];
    //
    //
    //    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (NSEC_PER_SEC *2.0)), dispatch_get_main_queue(), ^{
    //        [myView tb_updateConstraints:^(TBConstraintMaker *make) {
    //            make.top.equalTo(self.view).offset(20);
    //        }];
    //    });
    //
    //
    //    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (NSEC_PER_SEC *2.0)), dispatch_get_main_queue(), ^{
    //        [myView tb_remakeConstraints:^(TBConstraintMaker *make) {
    //            make.top.equalTo(self.view).offset(100);
    //            make.left.equalTo(self.view).offset(100);
    //            //        make.height.equalTo(@100).offset(30);
    //            //        make.width.equalTo(@100);
    //            make.size.equalTo(@(CGSizeMake(100, 100)));
    //        }];
    //    });
    
    
    //    UIView *myView2 = [[UIView alloc] init];
    //    myView2.backgroundColor = [UIColor blueColor];
    //    [myView addSubview:myView2];
    //    [myView2 tb_makeConstraints:^(TBConstraintMaker *make) {
    //        make.top.equalTo(myView);
    //        make.left.equalTo(myView.tb_right);
    //        make.height.equalTo(@55);
    //        make.width.equalTo(@56);
    //    }];
    
    //    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (NSEC_PER_SEC * 1.0)), dispatch_get_main_queue(), ^{
    //        NSArray *array = myView2.constraints;
    //        myView2 removeConstraint:<#(nonnull NSLayoutConstraint *)#>
    //        NSLog(@"%@", array);
    //    });
    
    
}


- (void)test2 {
    
    UIView *containerView = [[UIView alloc] init];
    containerView.backgroundColor = [UIColor redColor];
    [self.view addSubview:containerView];
    containerView.translatesAutoresizingMaskIntoConstraints = NO;
    
    // 宽
    NSLayoutConstraint *containerViewWith = [NSLayoutConstraint constraintWithItem:containerView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:kNilOptions multiplier:1.0 constant:100];
    [containerView addConstraint:containerViewWith];
    
    // 高度
    NSLayoutConstraint *containerViewHeight = [NSLayoutConstraint constraintWithItem:containerView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:kNilOptions multiplier:1.0 constant:100];
    [containerView addConstraint:containerViewHeight];
    
    // 左边距
    NSLayoutConstraint *containerViewLeft = [NSLayoutConstraint constraintWithItem:containerView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:10.0];
    [self.view addConstraint:containerViewLeft];
    
    // top
    NSLayoutConstraint *containerViewTop = [NSLayoutConstraint constraintWithItem:containerView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0];
    [self.view addConstraint:containerViewTop];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (NSEC_PER_SEC * 2.0)), dispatch_get_main_queue(), ^{
//        NSArray *array = containerView.constraints;
//        NSLog(@"%@", array);
//        containerViewTop.constant = 100;
//        NSLayoutConstraint *containerViewLeft2 = [NSLayoutConstraint constraintWithItem:containerView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:20.0];
//
//        [self.view removeConstraints:@[containerViewWith, containerViewHeight, containerViewLeft, containerViewTop]];
//
//        [self.view addConstraint:containerViewLeft2];
    });
}





@end
