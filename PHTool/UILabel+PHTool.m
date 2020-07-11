//
//  UILabel+PH.m
//  TestLabel
//
//  Created by zhangpenghui on 2020/7/3.
//  Copyright © 2020 zph. All rights reserved.
//

#import "UILabel+PHTool.h"

@implementation UILabel (PHTool)

-(UILabel *(^)(NSString *text))ph_text {
    UILabel *(^handle)(NSString *text) = ^(NSString *text) {
        self.text = text;
        return self;
    };
    return handle;
}

-(UILabel *(^)(NSMutableAttributedString *attributedString))ph_attributedText {
    return ^(NSMutableAttributedString *attributedString){
        self.attributedText = [[NSAttributedString alloc]initWithAttributedString:attributedString];
        return self;
    };
}

-(UILabel *(^)(UIColor *color))ph_backgroundColor {
    return ^(UIColor *color) {
        self.backgroundColor = color;
        return self;
    };
}

-(UILabel *(^)(UIColor *color))ph_textColor {
    return ^(UIColor *color) {
        self.textColor = color;
        return self;
    };
}

-(UILabel *(^)(UIFont *font))ph_font {
    return ^(UIFont *font) {
        self.font = font;
        return self;
    };
}

-(UILabel *(^)(NSTextAlignment textAlignment ))ph_textAlignment {
    return ^(NSTextAlignment textAlignment) {
        self.textAlignment = textAlignment;
        return self;
    };
}

-(UILabel *(^)(CGFloat cornerRadius))ph_cornerRadius {
    return ^(CGFloat cornerRadius){
        self.layer.cornerRadius = cornerRadius;
        self.layer.masksToBounds = true;
        return self;
    };
}

-(UILabel *(^)(NSInteger numberOfLines))ph_numberOfLines {
    return ^(NSInteger numberOfLines){
        self.numberOfLines = numberOfLines;
        return self;
    };
}

@end
