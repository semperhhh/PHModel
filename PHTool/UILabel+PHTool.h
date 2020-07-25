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
/// attributedText
-(UILabel *(^)(NSMutableAttributedString *attributedString))ph_attributedText;
/// cornerRadius
-(UILabel *(^)(CGFloat cornerRadius))ph_cornerRadius;
/// numberOfLines
-(UILabel *(^)(NSInteger numberOfLines))ph_numberOfLines;
/// tapHandle
-(UILabel *(^)(TapHandle tapHandle))ph_addTapHandle;
@end

NS_ASSUME_NONNULL_END
