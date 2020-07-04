//
//  UIImageView+ph.h
//  TestLabel
//
//  Created by zhangpenghui on 2020/7/4.
//  Copyright © 2020 zph. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (PH)

/// backgroundColor, need color
-(UIImageView *(^)(UIColor *color))ph_backgroundColor;
/// cornerRadius
-(UIImageView *(^)(CGFloat cornerRadius))ph_cornerRadius;
@end

NS_ASSUME_NONNULL_END
