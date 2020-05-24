//
//  HTTPSessionManager+Tweet.m
//  AWCoding
//
//  Created by 杨建祥 on 2018/3/2.
//  Copyright © 2018年 艾维科思. All rights reserved.
//

#import "HTTPSessionManager+Tweet.h"
#import "HTTPRequestParam.h"

@implementation HTTPSessionManager (Tweet)
- (RACSignal *)user_tweet:(NSInteger)last_id {
    HTTPRequestParam *param = [[HTTPRequestParam alloc] init];
    if (last_id) {
        param.data = @{@"last_id": @(last_id),
                       @"last_time": @0};
    }
    return [self requestWithPath:@"activities/user_tweet" param:param schema:[JXHTTPSchema schemaGet] class:nil tag:ApiTagNone isList:YES];
}

@end
