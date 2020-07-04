//
//  UIImageView+ph.m
//  TestLabel
//
//  Created by zhangpenghui on 2020/7/4.
//  Copyright © 2020 zph. All rights reserved.
//

#import "UIImageView+PH.h"

@implementation UIImageView (PH)

-(UIImageView *(^)(CGFloat cornerRadius))ph_cornerRadius {
    return ^(CGFloat cornerRadius){
        self.layer.cornerRadius = cornerRadius;
        self.layer.masksToBounds = true;
        return self;
    };
}

-(UIImageView *(^)(UIColor *color))ph_backgroundColor {
    return ^(UIColor *color){
        self.backgroundColor = color;
        return self;
    };
}

@end
