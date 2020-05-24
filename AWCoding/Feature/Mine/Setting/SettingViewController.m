//
//  SettingViewController.m
//  AWCoding
//
//  Created by 杨建祥 on 2018/3/1.
//  Copyright © 2018年 艾维科思. All rights reserved.
//

#import "SettingViewController.h"
#import "SettingViewModel.h"

@interface SettingViewController ()
@property (nonatomic, strong, readwrite) SettingViewModel *viewModel;
@property (nonatomic, weak) IBOutlet UIButton *logoutButton;

@end

@implementation SettingViewController
@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"设置";
    self.footerView.frame = CGRectMake(0, 0, JXAdaptScreenWidth(), JXAdaptScreen(80.0f));
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [SkinInstance configButton:self.logoutButton font:JXAdaptFont(17.0f) titleColor:[UIColor whiteColor] bgColor:JXColorHex(0xFC5A4F) borderWidth:0.0 borderRadius:22.0 borderColor:[UIColor clearColor]];
}

- (void)configCell:(JXCell *)cell indexPath:(NSIndexPath *)indexPath object:(NSString *)object {
    cell.textLabel.text = object;
    if ([object isEqualToString:@"清除缓存"]) {
        cell.infoLabel.text = @"5.10 M";
    }else {
        cell.infoLabel.text = nil;
    }
    cell.accessoryImageView.hidden = NO;
    cell.separatorImageView.hidden = [self.viewModel isLastObject:object];
    
    [cell.separatorImageView mas_updateConstraints:^(MASConstraintMaker *make) {
       make.leading.equalTo(cell.separatorImageView.superview).offset(12.0f);
    }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (IBAction)logoutButtonPressed:(id)sender {
    UIAlertController *sheet = [UIAlertController alertControllerWithTitle:@"确定要退出当前账号吗？" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [sheet addAction:[UIAlertAction actionWithTitle:@"确定退出" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [gUser logout];
    }]];
    [sheet addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:NULL]];
    [self.navigationController presentViewController:sheet animated:YES completion:NULL];
}


@end









