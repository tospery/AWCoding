//
//  CoinViewModel.m
//  AWCoding
//
//  Created by 杨建祥 on 2018/3/1.
//  Copyright © 2018年 艾维科思. All rights reserved.
//

#import "CoinViewModel.h"
#import "CoinAboutViewModel.h"

@implementation CoinViewModel
- (void)initialize {
    [super initialize];
    
    self.amount = @"--";
    
    self.shouldRequestRemoteDataOnViewDidLoad = YES;
    self.shouldPullToRefresh = YES;
    self.shouldInfiniteScrolling = YES;
    self.cellCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(RACTuple *t) {
        return [RACSignal empty];
    }];
    
    @weakify(self)
    self.requestRemoteDataCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(NSNumber *pageIndex) {
        @strongify(self)
        return [[HTTPInstance records:pageIndex.integerValue pageSize:JXInstance.pageSize] takeUntil:self.rac_willDeallocSignal];
    }];
    
    RACSignal *requestSignal = self.requestRemoteDataCommand.executionSignals.switchToLatest;
    RAC(self, dataSource) = [[requestSignal deliverOnMainThread] map:^id _Nullable(CoinList *list) {
        @strongify(self)
        self.isNoMoreData = (list.items.count >= list.totalItem);
        return JXArrTable(list.items);
    }];
}

- (RACCommand *)amountCommand {
    if (!_amountCommand) {
        @weakify(self)
        _amountCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            @strongify(self)
            return [[HTTPInstance points] takeUntil:self.rac_willDeallocSignal];
        }];
        [_amountCommand.errors subscribe:self.errors];
        [_amountCommand.executionSignals.switchToLatest subscribeNext:^(CoinAmount *amount) {
            @strongify(self)
            self.amount = JXStrWithFmt(@"%.2f", amount.points_left);
        }];
    }
    return _amountCommand;
}

- (RACCommand *)aboutCommand {
    if (!_aboutCommand) {
        _aboutCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            [MRCNavService pushViewModel:[[CoinAboutViewModel alloc] initWithData:nil] animated:YES];
            return [RACSignal empty];
        }];
    }
    return _aboutCommand;
}

@end









