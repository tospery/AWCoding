//
//  SkinManager.m
//  AWCoding
//
//  Created by 杨建祥 on 2018/2/27.
//  Copyright © 2018年 艾维科思. All rights reserved.
//

#import "SkinManager.h"

@implementation SkinManager
- (instancetype)init {
    if (self = [super init]) {
        self.mainColor = JXColorHex(0x0060FF);
        self.navItemColor = self.mainColor;
        self.navTintColor = [UIColor whiteColor];
        self.viewBgColor = JXColorHex(0xF5F5F5);
        self.tabItemColor = JXColorHex(0xA9B3BE);
        self.tabItemSelectedColor = self.mainColor;
    }
    return self;
}

- (void)configButtonStyle1:(UIButton *)button fontSize:(CGFloat)fontSize borderRadius:(CGFloat)borderRadius {
    button.backgroundColor = [UIColor clearColor];
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[[UIColor whiteColor] colorWithAlphaComponent:0.8]  forState:UIControlStateHighlighted];
    
    [button setBackgroundImage:[UIImage jx_imageWithColor:self.mainColor] forState:UIControlStateNormal];
    //[button setBackgroundImage:[UIImage jx_imageWithColor:[self.mainColor colorWithAlphaComponent:0.8]] forState:UIControlStateHighlighted];
    [button setBackgroundImage:[UIImage jx_imageWithColor:[self.mainColor colorWithAlphaComponent:0.5]] forState:UIControlStateDisabled];
    
    if (borderRadius) {
        [button jx_borderWithColor:[UIColor clearColor] width:0.0 radius:borderRadius];
    }
}

- (void)configButtonStyle2:(UIButton *)button fontSize:(CGFloat)fontSize borderRadius:(CGFloat)borderRadius {
    button.backgroundColor = [UIColor clearColor];
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    
    [button setTitleColor:self.mainColor forState:UIControlStateNormal];
    [button setTitleColor:[self.mainColor colorWithAlphaComponent:0.8]  forState:UIControlStateHighlighted];
    
    if (borderRadius) {
        [button jx_borderWithColor:self.mainColor width:1.0 radius:borderRadius];
    }
}

- (void)configButton:(UIButton *)button font:(UIFont *)font titleColor:(UIColor *)titleColor bgColor:(UIColor *)bgColor borderWidth:(CGFloat)borderWidth borderRadius:(CGFloat)borderRadius borderColor:(UIColor *)borderColor {
    button.backgroundColor = bgColor;
    button.titleLabel.font = font;
    
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button setTitleColor:[titleColor colorWithAlphaComponent:0.8]  forState:UIControlStateHighlighted];
    [button setTitleColor:[titleColor colorWithAlphaComponent:0.5]  forState:UIControlStateDisabled];
    
    [button setBackgroundImage:[UIImage jx_imageWithColor:bgColor] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage jx_imageWithColor:[bgColor colorWithAlphaComponent:0.5]] forState:UIControlStateDisabled];

    [button jx_borderWithColor:borderColor width:borderWidth radius:borderRadius];
}

@end
