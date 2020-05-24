//
//  SettingViewModel.m
//  AWCoding
//
//  Created by 杨建祥 on 2018/3/1.
//  Copyright © 2018年 艾维科思. All rights reserved.
//

#import "SettingViewModel.h"

@implementation SettingViewModel
- (void)initialize {
    [super initialize];
    
    self.dataSource = @[@[@"账号设置", @"清除缓存"]];
    self.cellCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(RACTuple *t) {
        return [RACSignal empty];
    }];
}


@end
