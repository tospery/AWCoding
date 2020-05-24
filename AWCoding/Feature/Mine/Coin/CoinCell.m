//
//  CoinCell.m
//  AWCoding
//
//  Created by 杨建祥 on 2018/3/2.
//  Copyright © 2018年 艾维科思. All rights reserved.
//

#import "CoinCell.h"

@interface CoinCell ()
@property (nonatomic, weak) IBOutlet UILabel *usageLabel;
@property (nonatomic, weak) IBOutlet UILabel *pointsLeftLabel;
@property (nonatomic, weak) IBOutlet UILabel *pointsChangeLabel;
@property (nonatomic, weak) IBOutlet UILabel *createdAtLabel;

@end

@implementation CoinCell
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setData:(Coin *)c {
    [super setData:c];
    
    self.usageLabel.text = c.usage;
    self.createdAtLabel.text = [c.created_at jx_stringWithFormat:kJXFormatDatetimeStyle1];
    self.pointsLeftLabel.text = JXStrWithFmt(@"余额:%.2f", c.points_left);
    self.pointsChangeLabel.text = JXStrWithFmt(@"%@%.2f", c.action ? @"+" : @"-", c.points_change);
    self.pointsChangeLabel.textColor = c.action ? SkinInstance.mainColor : JXColorHex(0xFB8638);
}

+ (CGFloat)height {
    return JXAdaptScreen(56.0f);
}

@end



