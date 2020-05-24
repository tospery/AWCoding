//
//  HTTPSessionManager+Account.h
//  AWCoding
//
//  Created by 杨建祥 on 2018/2/28.
//  Copyright © 2018年 艾维科思. All rights reserved.
//

#import "HTTPSessionManager.h"
#import "CoinList.h"
#import "CoinAmount.h"

@interface HTTPSessionManager (Account)
- (RACSignal *)login:(NSString *)account password:(NSString *)password;
- (RACSignal *)userKey:(NSString *)global_key;
- (RACSignal *)records:(NSInteger)page pageSize:(NSInteger)pageSize;
- (RACSignal *)points;


- (RACSignal *)getCode:(NSString *)mobile;
- (RACSignal *)login:(NSString *)mobile code:(NSString *)code weChatOpenid:(NSString *)weChatOpenid;
- (RACSignal *)getByAccountIdAllAddress;

@end
