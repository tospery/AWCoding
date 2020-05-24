//
//  HTTPRequestParam.m
//  AWCoding
//
//  Created by 杨建祥 on 2018/2/28.
//  Copyright © 2018年 艾维科思. All rights reserved.
//

#import "HTTPRequestParam.h"

@implementation HTTPRequestParam
- (NSDictionary *)commonHeader {
    NSMutableDictionary *header = [NSMutableDictionary dictionary];
    if (0 != gUser.token) {
        [header setObject:gUser.token forKey:@"token"];
    }
    return header;
}

@end
