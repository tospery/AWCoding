//
//  LoginViewController.m
//  AWCoding
//
//  Created by 杨建祥 on 2018/2/27.
//  Copyright © 2018年 艾维科思. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
@property (nonatomic, strong, readwrite) LoginViewModel *viewModel;

@property (nonatomic, strong) UIBarButtonItem *authItem;

@end

@implementation LoginViewController
@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.navigationController.navigationBar jx_configWithParam:@{kJXKeyTitleColor: JXColorHex(0x333333)}];
    [self.navigationController.navigationBar jx_transparet];
    self.navigationItem.rightBarButtonItem = self.authItem;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar jx_transparet];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar jx_reset];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [SkinInstance configButtonStyle1:self.loginButton fontSize:JXAdaptFontSize(17.0) borderRadius:0.0];
}

- (void)bindViewModel {
    [super bindViewModel];
    //self.contentView.backgroundColor = [UIColor redColor];
    
//    RAC(self.loginButton, enabled) = [RACSignal combineLatest:@[self.accountField.rac_textSignal, self.passwordField.rac_textSignal] reduce:^id(NSString *account, NSString *password){
//        return @(account.length != 0 && password.length !=0);
//    }];
    
    self.accountField.text = self.viewModel.account;
    self.passwordField.text = self.viewModel.password;
    
    RAC(self.viewModel, account) = self.accountField.rac_textSignal;
    RAC(self.viewModel, password) = self.passwordField.rac_textSignal;
    self.loginButton.rac_command = self.viewModel.loginCommand;
}

- (UIBarButtonItem *)authItem {
    if (!_authItem) {
        UIButton *authButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [authButton setTitle:@"  两步验证" forState:UIControlStateNormal];
        [authButton setImage:[JXImageWithName(@"twoFABtn_Nav") imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
        [authButton addTarget:self action:@selector(authButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [SkinInstance configButtonStyle2:authButton fontSize:JXAdaptFontSize(15.0f) borderRadius:0.0f];
        _authItem = [[UIBarButtonItem alloc] initWithCustomView:authButton];
    }
    return _authItem;
}

- (void)authButtonPressed:(UIButton *)btn {
    
}

@end





