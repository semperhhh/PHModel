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

/// text, need text and state
-(UIButton *(^)(NSString *text, UIControlState state))ph_text;
/// color, need color and state
-(UIButton *(^)(UIColor *color, UIControlState state))ph_color;
/// font, need font
-(UIButton *(^)(UIFont *font))ph_font;
/// backgroundColor, need color
-(UIButton *(^)(UIColor *color))ph_backgroundColor;
/// image, need image and state
-(UIButton *(^)(UIImage *image, UIControlState state))ph_image;
/// backgroundImage, need image and state
-(UIButton *(^)(UIImage *image, UIControlState state))ph_backgroundImage;
/// add target, need target, action and event
-(UIButton *(^)(id target, SEL action, UIControlEvents event))ph_addTarge;
/// add target handle, need event and call-back;
-(UIButton *(^)(UIControlEvents event, void(^handle)(void)))ph_buttonActionHandle;
/// cornerRadius
-(UIButton *(^)(CGFloat cornerRadius))ph_cornerRadius;
/// buttonImageType
- (UIButton *(^)(PHButtonImagetype type, CGFloat margin))ph_layoutWithStatus;
@end

NS_ASSUME_NONNULL_END
