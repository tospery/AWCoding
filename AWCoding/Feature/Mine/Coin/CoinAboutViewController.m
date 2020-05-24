//
//  CoinAboutViewController.m
//  AWCoding
//
//  Created by 杨建祥 on 2018/3/2.
//  Copyright © 2018年 艾维科思. All rights reserved.
//

#import "CoinAboutViewController.h"

@interface CoinAboutViewController ()
@property (nonatomic, weak) IBOutlet UILabel *label;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *heightConstraint;

@end

@implementation CoinAboutViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"关于码币";

    NSString *text = self.label.text;
    NSMutableAttributedString *ma = [NSMutableAttributedString jx_attributedStringWithString:text color:JXColorHex(0x425063) font:JXAdaptFont(14)];
    [ma jx_addLineSpacing:5.0 alignment:NSTextAlignmentLeft];
    
    NSArray *titles = @[@"什么是码币", @"可以用码币做什么", @"如何获取码币"];
    for (NSString *t in titles) {
        NSRange r = [text rangeOfString:t];
        if (r.location != NSNotFound) {
            [ma jx_addAttributeWithColor:JXColorHex(0x323A45) font:JXAdaptFontBold(15) range:r];
        }
    }
    
    self.label.attributedText = ma;
    
    CGSize size = [TTTAttributedLabel sizeThatFitsAttributedString:ma withConstraints:CGSizeMake(JXAdaptScreenWidth() - 12 * 2 - 8 * 2, UINT32_MAX) limitedToNumberOfLines:0];
    self.heightConstraint.constant = size.height + JXAdaptScreen(50.0f);
}

@end
