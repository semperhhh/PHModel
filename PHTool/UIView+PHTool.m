//
//  UIView+PHTool.m
//  testModel_OC
//
//  Created by zhangpenghui on 2020/8/1.
//  Copyright © 2020 zph. All rights reserved.
//

#import "UIView+PHTool.h"
#import <objc/runtime.h>

@implementation UIView (PHTool)

static void *tapHandleKey = @"tapHandleKey";

-(void)setTapHandle:(TapHandle)tapHandle {
    objc_setAssociatedObject(self, tapHandleKey, tapHandle, OBJC_ASSOCIATION_COPY);
}

-(TapHandle)tapHandle {
    return objc_getAssociatedObject(self, tapHandleKey);
}


-(UIView *(^)(UIColor *color))ph_backgroundColor {
    return ^(UIColor *color){
        
        self.backgroundColor = color;
        return self;
    };
}

-(UIView *(^)(CGFloat cornerRadius))ph_cornerRadius {
    return ^(CGFloat cornerRadius){
        self.layer.cornerRadius = cornerRadius;
        self.layer.masksToBounds = true;
        return self;
    };
}

-(UIView *(^)(TapHandle tapHandle))ph_addTapHandle {
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

@end
