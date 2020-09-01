//
//  UIView+PHTool.h
//  testModel_OC
//
//  Created by zhangpenghui on 2020/8/1.
//  Copyright © 2020 zph. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TapHandle)(void);

NS_ASSUME_NONNULL_BEGIN

@interface UIView (PHTool)

@property (nonatomic,strong) TapHandle tapHandle;

/// tap
-(UIView *(^)(TapHandle tapHandle))ph_addTapHandle;


@end

NS_ASSUME_NONNULL_END
