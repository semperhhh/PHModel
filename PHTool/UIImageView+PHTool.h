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

/// backgroundColor, need color
-(UIImageView *(^)(UIColor *color))ph_backgroundColor;
/// cornerRadius
-(UIImageView *(^)(CGFloat cornerRadius))ph_cornerRadius;
/// contentModel
-(UIImageView *(^)(UIViewContentMode mode))ph_contentMode;
/// tapHandle
-(UIImageView *(^)(TapHandle tapHandle))ph_addTapHandle;
/// image
-(UIImageView *(^)(UIImage *image))ph_addImage;
@end

NS_ASSUME_NONNULL_END
