//
//  UIButton+PH.m
//  TestLabel
//
//  Created by zhangpenghui on 2020/7/3.
//  Copyright © 2020 zph. All rights reserved.
//

#import "UIButton+PHTool.h"
#import <objc/runtime.h>

static void *key = "key";

@implementation UIButton (PHTool)

-(void)setButtonActionHandle:(void (^)(void))buttonActionHandle {
    objc_setAssociatedObject(self, key, buttonActionHandle, OBJC_ASSOCIATION_COPY);
}

-(void (^)(void))buttonActionHandle {
    return objc_getAssociatedObject(self, key);
}

-(UIButton *(^)(NSString *text, UIControlState state))ph_text {
    return ^(NSString *text, UIControlState state){
        [self setTitle:text forState:state];
        return self;
    };
}

-(UIButton *(^)(UIColor *color, UIControlState state))ph_color {
    return ^(UIColor *color, UIControlState state){
        [self setTitleColor:color forState:state];
        return self;
    };
}

-(UIButton *(^)(UIFont *font))ph_font {
    return ^(UIFont *font){
        self.titleLabel.font = font;
        return self;
    };
}

-(UIButton *(^)(UIColor *color))ph_backgroundColor {
    return ^(UIColor *color){
        self.backgroundColor = color;
        return self;
    };
}

-(UIButton *(^)(UIImage *image, UIControlState state))ph_image {
    return ^(UIImage *image, UIControlState state){
        [self setImage:image forState:state];
        return self;
    };
}

-(UIButton *(^)(UIImage *image, UIControlState state))ph_backgroundImage {
    return ^(UIImage *image, UIControlState state){
        [self setBackgroundImage:image forState:state];
        return self;
    };
}

-(UIButton *(^)(id target, SEL action, UIControlEvents event))ph_addTarge {
    return ^(id target, SEL action, UIControlEvents event){
        [self addTarget:target action:action forControlEvents:event];
        return self;
    };
}

-(UIButton *(^)(UIControlEvents event, void(^handle)(void)))ph_buttonActionHandle {
    return ^(UIControlEvents event, void(^handle)(void)){
        [self addTarget:self action:@selector(buttonAction) forControlEvents:event];
        self.buttonActionHandle = handle;
        return self;
    };
}

-(void)buttonAction {
    if (self.buttonActionHandle) {
        self.buttonActionHandle();
    }
}

-(UIButton *(^)(CGFloat cornerRadius))ph_cornerRadius {
    return ^(CGFloat cornerRadius){
        self.layer.cornerRadius = cornerRadius;
        self.layer.masksToBounds = true;
        return self;
    };
}

//MARK: button文字和图标位置
- (UIButton *(^)(PHButtonImagetype type, CGFloat margin))ph_layoutWithStatus {
    
    return ^(PHButtonImagetype type, CGFloat margin){
        
        CGFloat imgWidth = self.imageView.bounds.size.width;
        CGFloat imgHeight = self.imageView.bounds.size.height;
        CGFloat labWidth = self.titleLabel.bounds.size.width;
        CGFloat labHeight = self.titleLabel.bounds.size.height;
        CGSize textSize = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}];
        CGSize frameSize = CGSizeMake(ceilf(textSize.width), ceilf(textSize.height));
        if (labWidth < frameSize.width) {
            labWidth = frameSize.width;
        }
        CGFloat kMargin = margin/2.0;
        switch (type) {
            case PHButtonImagetypeNormal://图左字右
                [self setImageEdgeInsets:UIEdgeInsetsMake(0, -kMargin, 0, kMargin)];
                [self setTitleEdgeInsets:UIEdgeInsetsMake(0, kMargin, 0, -kMargin)];
                break;
            case PHButtonImagetypeRight://图右字左
                [self setImageEdgeInsets:UIEdgeInsetsMake(0, labWidth + kMargin, 0, -labWidth - kMargin)];
                [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -imgWidth - kMargin, 0, imgWidth + kMargin)];
                break;
            case PHButtonImagetypeTop://图上字下
                [self setImageEdgeInsets:UIEdgeInsetsMake(0,0, labHeight + margin, -labWidth)];
                [self setTitleEdgeInsets:UIEdgeInsetsMake(imgHeight + margin, -imgWidth, 0, 0)];
                break;
            case PHButtonImagetypeBottom://图下字上
                [self setImageEdgeInsets:UIEdgeInsetsMake(labHeight + margin,0, 0, -labWidth)];
                [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -imgWidth, imgHeight + margin, 0)];
                
                break;
            default:
                break;
        }
        
        return self;
    };
}

@end
