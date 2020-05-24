//
//  SkinManager.h
//  AWCoding
//
//  Created by 杨建祥 on 2018/2/27.
//  Copyright © 2018年 艾维科思. All rights reserved.
//

#import "JXSkinManager.h"

#define SkinInstance                ([SkinManager sharedInstance])

@interface SkinManager : JXSkinManager

- (void)configButtonStyle2:(UIButton *)button fontSize:(CGFloat)fontSize borderRadius:(CGFloat)borderRadius;

- (void)configButton:(UIButton *)button font:(UIFont *)font titleColor:(UIColor *)titleColor bgColor:(UIColor *)bgColor borderWidth:(CGFloat)borderWidth borderRadius:(CGFloat)borderRadius borderColor:(UIColor *)borderColor;

@end
