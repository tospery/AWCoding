//
//  MineViewModel.m
//  AWCoding
//
//  Created by 杨建祥 on 2018/2/27.
//  Copyright © 2018年 艾维科思. All rights reserved.
//

#import "MineViewModel.h"
#import "CoinViewModel.h"
#import "SettingViewModel.h"
#import "TestViewModel.h"

@interface MineViewModel ()

@end

@implementation MineViewModel
- (void)initialize {
    [super initialize];
    self.shouldPullToRefresh = YES;
    
//    @weakify(self)
//    self.requestRemoteDataCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id input {
//        @strongify(self)
//        return [self.userCommand execute:gUser.global_key];
//    }];
    
    @weakify(self)
    self.requestRemoteDataCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        @strongify(self)
       return [self.userCommand execute:gUser.global_key];
    }];
}

- (RACCommand *)itemCommand {
    if (!_itemCommand) {
        _itemCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(UIButton *btn) {
            JXMRCViewModel *viewModel = nil;
            switch (btn.tag) {
                case 100:
                    viewModel = [[CoinViewModel alloc] initWithData:nil];
                    break;
                case 112:
                    // TestViewModel
                    // viewModel = [[SettingViewModel alloc] initWithData:nil];
                    viewModel = [[TestViewModel alloc] initWithData:nil];
                    break;
                default:
                    break;
            }
            if (viewModel) {
                [MRCNavService pushViewModel:viewModel animated:YES];
            }
            
            return [RACSignal empty];
        }];
    }
    return _itemCommand;
}

- (RACCommand *)userCommand {
    if (!_userCommand) {
        @weakify(self)
        _userCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(NSString *key) {
            @strongify(self)
            return [[HTTPInstance userKey:key] takeUntil:self.rac_willDeallocSignal];
        }];
        [_userCommand.errors subscribe:self.errors];
        [_userCommand.executionSignals.switchToLatest subscribeNext:^(User *user) {
            user.isLogined = YES;
            [gUser setupWithUser:user];
        }];
    }
    return _userCommand;
}

@end




