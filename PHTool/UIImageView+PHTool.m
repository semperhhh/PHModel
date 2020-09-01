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


@end

