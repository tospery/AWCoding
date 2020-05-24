//
//  CoinList.m
//  AWCoding
//
//  Created by 杨建祥 on 2018/3/1.
//  Copyright © 2018年 艾维科思. All rights reserved.
//

#import "CoinList.h"

@implementation CoinList
+ (NSDictionary *)mj_objectClassInArray {
    return @{@"items": [Coin class]};
}

@end
