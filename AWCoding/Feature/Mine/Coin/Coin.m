//
//  Coin.m
//  AWCoding
//
//  Created by 杨建祥 on 2018/3/1.
//  Copyright © 2018年 艾维科思. All rights reserved.
//

#import "Coin.h"

@implementation Coin
- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property {
    if ([oldValue isKindOfClass:[NSNull class]]) {
        return nil;
    }
    
    if (property.type.typeClass == [NSDate class]) {
        return [NSDate dateWithTimeIntervalSince1970:([(NSNumber *)oldValue longLongValue] / 1000.0f)];
    }
    
    return oldValue;
}

@end
