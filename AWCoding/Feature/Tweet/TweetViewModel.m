//
//  TweetViewModel.m
//  AWCoding
//
//  Created by 杨建祥 on 2018/2/27.
//  Copyright © 2018年 艾维科思. All rights reserved.
//

#import "TweetViewModel.h"
#import "TweetFriendViewModel.h"

@implementation TweetViewModel
- (RACCommand *)testCommand {
    if (!_testCommand) {
        _testCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            [MRCNavService pushViewModel:[[TweetFriendViewModel alloc] initWithData:nil] animated:YES];
            return [RACSignal empty];
        }];
    }
    return _testCommand;
}

@end
