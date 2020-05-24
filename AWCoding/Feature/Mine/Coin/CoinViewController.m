//
//  CoinViewController.m
//  AWCoding
//
//  Created by 杨建祥 on 2018/3/1.
//  Copyright © 2018年 艾维科思. All rights reserved.
//

#import "CoinViewController.h"
#import "CoinCell.h"
#import "CoinViewModel.h"

@interface CoinViewController ()
@property (nonatomic, strong, readwrite) CoinViewModel *viewModel;

@property (nonatomic, weak) IBOutlet UILabel *amountLabel;

@end

@implementation CoinViewController
@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"我的码币";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:JXImageWithName(@"tip_normal_Nav") style:UIBarButtonItemStylePlain target:self action:@selector(aboutItemPressed:)];
    
    UINib *nib = [UINib nibWithNibName:@"CoinCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:[CoinCell identifier]];
}

- (void)bindViewModel {
    [super bindViewModel];
    
    // 赋值
    // self.amountLabel.text = self.viewModel.amount;
    
    // 绑定
    RAC(self.amountLabel, text) = RACObserve(self.viewModel, amount);
    
    // 请求
    [self.viewModel.amountCommand execute:nil];
}

- (CGFloat)heightForRowAtIndexPath:(NSIndexPath *)indexPath object:(id)object {
    return [CoinCell height];
}

- (UITableViewCell *)cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(id)object {
    return [self.tableView dequeueReusableCellWithIdentifier:[CoinCell identifier] forIndexPath:indexPath];
}

- (void)configCell:(CoinCell *)cell indexPath:(NSIndexPath *)indexPath object:(Coin *)object {
    cell.data = object;
}

- (void)aboutItemPressed:(id)sender {
    [self.viewModel.aboutCommand execute:nil];
}

@end





