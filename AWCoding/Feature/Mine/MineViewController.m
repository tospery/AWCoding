//
//  MineViewController.m
//  AWCoding
//
//  Created by 杨建祥 on 2018/2/27.
//  Copyright © 2018年 艾维科思. All rights reserved.
//

#import "MineViewController.h"
#import "MineViewModel.h"

@interface MineViewController ()
@property (nonatomic, strong, readwrite) MineViewModel *viewModel;

@property (nonatomic, strong) UIBarButtonItem *addItem;

@property (nonatomic, weak) IBOutlet UIImageView *avatarImageView;
@property (nonatomic, weak) IBOutlet UIImageView *vipImageView;
@property (nonatomic, weak) IBOutlet UILabel *projectLabel;
@property (nonatomic, weak) IBOutlet UILabel *teamLabel;
@property (nonatomic, strong) IBOutletCollection(UIImageView) NSArray *lineImageViews;
@property (nonatomic, strong) IBOutletCollection(UIButton) NSArray *itemButtons;

@end

@implementation MineViewController
@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.navigationController.navigationBar jx_configWithParam:@{kJXKeyBarTintColor: [UIColor whiteColor], kJXKeyTitleColor: JXColorHex(0x333333)}];
    self.navigationItem.title = @"我";
    self.navigationItem.rightBarButtonItem = self.addItem;
    
    NSString *str = @"2 项目";
    NSMutableAttributedString *maStr = [NSMutableAttributedString jx_attributedStringWithString:str color:JXColorHex(0x888888) font:JXAdaptFont(12.0f)];
    [maStr jx_addAttributeWithColor:JXColorHex(0x333333) font:JXAdaptFontBold(22.0f) range:NSMakeRange(0, str.length - 3)];
    self.projectLabel.attributedText = maStr;
    
    str = @"0 团队";
    maStr = [NSMutableAttributedString jx_attributedStringWithString:str color:JXColorHex(0x888888) font:JXAdaptFont(12.0f)];
    [maStr jx_addAttributeWithColor:JXColorHex(0x333333) font:JXAdaptFontBold(22.0f) range:NSMakeRange(0, str.length - 3)];
    self.teamLabel.attributedText = maStr;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.viewModel.userCommand execute:gUser.global_key];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self.avatarImageView jx_circleWithColor:[UIColor clearColor] border:0.0];
    [self.vipImageView jx_circleWithColor:[UIColor whiteColor] border:1.0];
}

- (void)bindViewModel {
    [super bindViewModel];
    
    // self.contentView.backgroundColor = [UIColor redColor];
    for (UIButton *btn in self.itemButtons) {
        btn.rac_command = self.viewModel.itemCommand;
    }
}

- (UIBarButtonItem *)addItem {
    if (!_addItem) {
        _addItem = [[UIBarButtonItem alloc] initWithImage:JXImageWithName(@"addUserBtn_Nav") style:UIBarButtonItemStylePlain target:self action:@selector(addItemPressed:)];
    }
    return _addItem;
}

- (void)addItemPressed:(id)sender {
    
}

@end






