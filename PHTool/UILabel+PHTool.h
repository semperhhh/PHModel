//
//  UILabel+PH.h
//  TestLabel
//
//  Created by zhangpenghui on 2020/7/3.
//  Copyright © 2020 zph. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TapHandle)(void);

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (PHTool)

@property (nonatomic,strong) TapHandle tapHandle;

/// tapHandle
-(UILabel *(^)(TapHandle tapHandle))ph_addTapHandle;
@end

NS_ASSUME_NONNULL_END
