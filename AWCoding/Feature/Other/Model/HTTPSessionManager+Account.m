//
//  HTTPSessionManager+Account.m
//  AWCoding
//
//  Created by 杨建祥 on 2018/2/28.
//  Copyright © 2018年 艾维科思. All rights reserved.
//

#import "HTTPSessionManager+Account.h"
#import "HTTPRequestParam.h"

@implementation HTTPSessionManager (Account)
- (RACSignal *)login:(NSString *)account password:(NSString *)password {
    JXCheck(account, JXArgErrSingal);
    JXCheck(password, JXArgErrSingal);
    
    HTTPRequestParam *param = [[HTTPRequestParam alloc] init];
    param.data = @{@"account": account,
                   @"password": [password jx_sha1],
                   @"remember_me": @YES};
    
    return [self requestWithPath:@"v2/account/login" param:param schema:[JXHTTPSchema schemaPost] class:[User class] tag:ApiTagNone isList:NO];
}

- (RACSignal *)userKey:(NSString *)global_key {
    JXCheck(global_key, JXArgErrSingal);
    
    NSString *path = JXStrWithFmt(@"user/key/%@", global_key);
    return [self requestWithPath:path param:nil schema:[JXHTTPSchema schemaGet] class:[User class] tag:ApiTagNone isList:NO];
}

- (RACSignal *)records:(NSInteger)page pageSize:(NSInteger)pageSize {
    JXCheck(@(page), JXArgErrSingal);
    JXCheck(@(pageSize), JXArgErrSingal);
    
    HTTPRequestParam *param = [[HTTPRequestParam alloc] init];
    param.data = @{@"page": @(page),
                   @"pageSize": @(pageSize)};
    
    return [self requestWithPath:@"point/records" param:param schema:[JXHTTPSchema schemaGet] class:[CoinList class] tag:ApiTagNone isList:NO];
}

- (RACSignal *)points {
    return [self requestWithPath:@"point/points" param:nil schema:[JXHTTPSchema schemaGet] class:[CoinAmount class] tag:ApiTagNone isList:NO];
}


- (RACSignal *)getCode:(NSString *)mobile {
    JXCheck(mobile, JXArgErrSingal);
    
    HTTPRequestParam *param = [[HTTPRequestParam alloc] init];
    param.data = @{@"mobile": mobile};
    return [self requestWithPath:@"v1/general/getCode" param:param schema:[JXHTTPSchema schemaPost] class:nil tag:ApiTagNone isList:NO];
}

- (RACSignal *)login:(NSString *)mobile code:(NSString *)code weChatOpenid:(NSString *)weChatOpenid {
    JXCheck(mobile, JXArgErrSingal);
    JXCheck(code, JXArgErrSingal);
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    if (0 != mobile.length) {
        [params setObject:mobile forKey:@"mobile"];
    }
    if (0 != code.length) {
        [params setObject:code forKey:@"code"];
    }
    if (0 != weChatOpenid.length) {
        [params setObject:weChatOpenid forKey:@"appOpenid"];
    }
    
    //[param setObject:@1 forKey:@"loginType"];
    [params setObject:@1 forKey:@"source"];
    
    HTTPRequestParam *param = [[HTTPRequestParam alloc] init];
    param.data = params;
    
    return [self requestWithPath:@"v1/wiseAccount/login" param:param schema:[JXHTTPSchema schemaPostRawJSON2JSON] class:[User class] tag:ApiTagNone isList:NO];
}

- (RACSignal *)getByAccountIdAllAddress {
    HTTPRequestParam *param = [[HTTPRequestParam alloc] init];
    param.header = [param commonHeader];
    return [self requestWithPath:@"v1/shop/address/getByAccountIdAllAddress" param:param schema:[JXHTTPSchema schemaPost] class:[User class] tag:ApiTagNone isList:YES];
}

@end
