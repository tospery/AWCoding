//
//  LoginViewModel.m
//  AWCoding
//
//  Created by 杨建祥 on 2018/2/27.
//  Copyright © 2018年 艾维科思. All rights reserved.
//

#import "LoginViewModel.h"

@interface LoginViewModel ()

@end

@implementation LoginViewModel
- (void)initialize {
    [super initialize];
    self.viewBgColor = [UIColor whiteColor];
    
    self.account = @"tospery";
    self.password = @"cdJX072133";
    
    @weakify(self)
    self.loginCommand = [[RACCommand alloc] initWithEnabled:[[RACSignal combineLatest:@[RACObserve(self, account), RACObserve(self, password)] reduce:^id(NSString *account, NSString *password){
        return @(account.length != 0 && password.length !=0);
    }] distinctUntilChanged] signalBlock:^RACSignal * _Nonnull(UIButton *btn) {
        @strongify(self)
        return [[HTTPInstance login:self.account password:self.password] takeUntil:self.rac_willDeallocSignal];
    }];
    [self.loginCommand.executing subscribe:self.executing];
    [self.loginCommand.errors subscribe:self.errors];
    [self.loginCommand.executionSignals.switchToLatest subscribeNext:^(User *user) {
        @strongify(self)
        [gUser loginWithUser:user];
        if (self.didLoginBlock) {
            self.didLoginBlock();
        }
        [JXDialog hideHUD];
    }];
}




@end



