//
//  UILabel+PH.h
//  TestLabel
//
//  Created by zhangpenghui on 2020/7/3.
//  Copyright © 2020 zph. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (PH)

/// text
-(UILabel *(^)(NSString *text))ph_text;
/// backgroundColor
-(UILabel *(^)(UIColor *color))ph_backgroundColor;
/// textColor
-(UILabel *(^)(UIColor *color))ph_textColor;
/// font
-(UILabel *(^)(UIFont *font))ph_font;
/// textAlignment
-(UILabel *(^)(NSTextAlignment textAttachment))ph_textAlignment;
/// cornerRadius
-(UILabel *(^)(CGFloat cornerRadius))ph_cornerRadius;
@end

NS_ASSUME_NONNULL_END
