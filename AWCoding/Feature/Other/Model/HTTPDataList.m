//
//  HTTPDataList.m
//  AWCoding
//
//  Created by 杨建祥 on 2018/3/1.
//  Copyright © 2018年 艾维科思. All rights reserved.
//

#import "HTTPDataList.h"

@implementation HTTPDataList
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"pageIndex": @"page",
             @"pageSize": @"pageSize",
             @"totalPage": @"totalPage",
             @"totalItem": @"totalRow",
             @"items": @"list"};
}

@end
