//
//  NSMutableAttributedString+PH.h
//  TestLabel
//
//  Created by zhangpenghui on 2020/7/6.
//  Copyright © 2020 zph. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, PHAttributedMode) {
    PHAttributedModeNormal = 0,         //默认,正常
    PHAttributedModeBackwards = 1,      //倒序查找
    PHAttributedModeRemain = 2,         //全部查找
    PHAttributedModeScope = 4,          //给定范围查找
    PHAttributedModeAfterAppoint = 8,   //从给定的字符后面查找
    PHAttributedModeBeforeAppoint = 16, //从给定的字符前面查找
};

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableAttributedString (PHTool)

/// init
/// @param str string
/// @param placeholder string
-(instancetype)initWithString:(NSString *)str placeholder:(NSString *)placeholder;
/// need PHAttributedMode(normal,backwards,remain) string dictionary
-(NSMutableAttributedString *(^)(PHAttributedMode mode, NSString * string, NSDictionary<NSAttributedStringKey, id> *dictionary))ph_addattributes;
/// need range string dictionary
-(NSMutableAttributedString *(^)(NSRange range, NSString * string, NSDictionary<NSAttributedStringKey, id> *dictionary))ph_addattributesWithScope;
/// need PHAttributedMode(after,before) appoint string dictionary
-(NSMutableAttributedString *(^)(PHAttributedMode mode, NSString *appoint, NSString * string, NSDictionary<NSAttributedStringKey, id> *dictionary))ph_addattributesWithAppoint;
@end

NS_ASSUME_NONNULL_END
