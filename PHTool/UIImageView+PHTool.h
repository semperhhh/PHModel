//
//  UIImageView+ph.h
//  TestLabel
//
//  Created by zhangpenghui on 2020/7/4.
//  Copyright © 2020 zph. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TapHandle)(void);

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (PHTool)

@property (nonatomic,strong) TapHandle tapHandle;
/// tapHandle
-(UIImageView *(^)(TapHandle tapHandle))ph_addTapHandle;
@end

NS_ASSUME_NONNULL_END
