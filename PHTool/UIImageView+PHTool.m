//
//  UIImageView+ph.m
//  TestLabel
//
//  Created by zhangpenghui on 2020/7/4.
//  Copyright © 2020 zph. All rights reserved.
//

#import "UIImageView+PHTool.h"
#import <objc/runtime.h>

@implementation UIImageView (PHTool)

static void *tapHandlekey = @"tapHandleKey";

-(void)setTapHandle:(TapHandle)tapHandle {
    objc_setAssociatedObject(self, tapHandlekey, tapHandle, OBJC_ASSOCIATION_COPY);
}

-(TapHandle)tapHandle {
    return objc_getAssociatedObject(self, tapHandlekey);
}

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

-(UIImageView *(^)(UIViewContentMode mode))ph_contentMode {
    return ^(UIViewContentMode mode){
        self.contentMode = mode;
        return self;
    };
}

-(UIImageView *(^)(TapHandle tapHandle))ph_addTapHandle {
    return ^(TapHandle tapHandle){
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
        [self addGestureRecognizer:tap];
        self.userInteractionEnabled = true;
        self.tapHandle = tapHandle;
        return self;
    };
}

-(void)tapAction {
    if (self.tapHandle) {
        self.tapHandle();
    }
}

-(UIImageView *(^)(UIImage *image))ph_addImage {
    return ^(UIImage *image){
        self.image = image;
        return self;
    };
}

@end

