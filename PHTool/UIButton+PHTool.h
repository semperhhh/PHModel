//
//  UIButton+PH.h
//  TestLabel
//
//  Created by zhangpenghui on 2020/7/3.
//  Copyright © 2020 zph. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, PHButtonImagetype) {
    PHButtonImagetypeNormal = 0,
    PHButtonImagetypeRight = 1,
    PHButtonImagetypeTop = 2,
    PHButtonImagetypeBottom = 4,
};

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (PHTool)

@property (nonatomic,copy) void (^buttonActionHandle)(void);

/// add target, need target, action and event
-(UIButton *(^)(id target, SEL action, UIControlEvents event))ph_addTarge;
/// add target handle, need event and call-back;
-(UIButton *(^)(UIControlEvents event, void(^handle)(void)))ph_buttonActionHandle;
/// buttonImageType
- (UIButton *(^)(PHButtonImagetype type, CGFloat margin))ph_layoutWithStatus;

@end

NS_ASSUME_NONNULL_END
