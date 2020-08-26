//
//  NSMutableAttributedString+PH.m
//  TestLabel
//
//  Created by zhangpenghui on 2020/7/6.
//  Copyright © 2020 zph. All rights reserved.
//

#import "NSMutableAttributedString+PHTool.h"

@implementation NSMutableAttributedString (PHTool)

-(instancetype)initWithString:(NSString *)str placeholder:(NSString *)placeholder {
    
    if (str == nil && placeholder != nil) {
        str = placeholder;
    }
    
    return [self initWithString:str];
}

//MARK: normal
-(NSMutableAttributedString *(^)(PHAttributedMode mode, NSString * string, NSDictionary<NSAttributedStringKey, id> *dictionary))ph_addattributes {
    
    NSMutableAttributedString * (^handle)(PHAttributedMode mode, NSString *string, NSDictionary <NSAttributedStringKey, id> *dictionary) = ^(PHAttributedMode mode, NSString *string, NSDictionary <NSAttributedStringKey, id> *dictionary) {
    
        switch (mode) {
            case PHAttributedModeNormal: {
                
                //正序匹配
                NSRange range = [self.string rangeOfString:string];
                if (range.location <= self.string.length) {
                    [self addAttributes:dictionary range:range];
                }
            }
                break;
            case PHAttributedModeBackwards: {
                //倒序匹配
                NSRange backwardsRange = [self.string rangeOfString:string options:NSBackwardsSearch];
                if (backwardsRange.location <= self.string.length) {
                    [self addAttributes:dictionary range:backwardsRange];
                }
            }
                break;
            case PHAttributedModeRemain: {
                //全部匹配
                NSString *remainString = self.string;
                while (true) {
                    NSRange backwards = [remainString rangeOfString:string options:NSBackwardsSearch];
                    if (backwards.location <= remainString.length) {
                        [self addAttributes:dictionary range:backwards];
                        remainString = [self.string substringToIndex:backwards.location];
                    } else {
                        break;
                    }
                }
            }
                break;
            default:
                break;
        }
        
        return self;
    };
    
    return handle;
}

//MARK: scope
-(NSMutableAttributedString *(^)(NSRange range, NSString * string, NSDictionary<NSAttributedStringKey, id> *dictionary))ph_addattributesWithScope {
    
    return ^(NSRange range, NSString * string, NSDictionary<NSAttributedStringKey, id> *dictionary){
        
        //给定范围匹配
        NSRange scopeRange = [self.string rangeOfString:string options:NSLiteralSearch range: range];
        if (scopeRange.location <= self.string.length) {
            [self addAttributes:dictionary range:scopeRange];
        }
        
        return self;
    };
}

//MARK: appoint
-(NSMutableAttributedString *(^)(PHAttributedMode mode, NSString *appoint, NSString * string, NSDictionary<NSAttributedStringKey, id> *dictionary))ph_addattributesWithAppoint {
    
    return ^(PHAttributedMode mode, NSString *appoint, NSString * string, NSDictionary<NSAttributedStringKey, id> *dictionary) {
        
        NSRange appointRange = [self.string rangeOfString:appoint];
        
        switch (mode) {
            case PHAttributedModeAfterAppoint: {
                //指定字符后面的内容进行匹配
                if (appointRange.location <= self.string.length) {
                    NSString *appointAfterString = [self.string substringFromIndex:appointRange.location + appointRange.length];
                    NSRange afterRange = [self.string rangeOfString:string options:NSLiteralSearch range:NSMakeRange(appointRange.location + appointRange.length, appointAfterString.length)];
                    
                    if (afterRange.length > 0) {
                        [self addAttributes:dictionary range:afterRange];
                    }
                }
                break;
                
            case PHAttributedModeBeforeAppoint: {
                //指定字符前面的内容进行匹配
                if (appointRange.location <= self.string.length) {
                    NSString *appointBeforeString = [self.string substringToIndex:appointRange.location];
                    NSRange beforeRange = [appointBeforeString rangeOfString:string];
                    if (beforeRange.length > 0) {
                        [self addAttributes:dictionary range:beforeRange];
                    }
                }
            }
                break;
            default:
                break;
        }
        
        return self;
    };
}

// MARK: attriString Size from size
-(CGSize (^)(CGSize size))ph_attriStringSize {
    
    return ^(CGSize size){
        
        if (self.length == 0 || self == nil) {
            return CGSizeZero;
        }
        CGRect rect = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin context:nil];
        
        return rect.size;
    };
}

@end
