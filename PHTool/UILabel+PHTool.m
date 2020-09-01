//
//  UILabel+PH.m
//  TestLabel
//
//  Created by zhangpenghui on 2020/7/3.
//  Copyright © 2020 zph. All rights reserved.
//

#import "UILabel+PHTool.h"
#import <objc/runtime.h>

@implementation UILabel (PHTool)

static void *tapHandleKey = @"tapHandleKey";
    
-(void)setTapHandle:(TapHandle)tapHandle {
    objc_setAssociatedObject(self, tapHandleKey, tapHandle, OBJC_ASSOCIATION_COPY);
}

-(TapHandle)tapHandle {
    return objc_getAssociatedObject(self, tapHandleKey);
}

-(UILabel *(^)(TapHandle tapHandle))ph_addTapHandle {
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
