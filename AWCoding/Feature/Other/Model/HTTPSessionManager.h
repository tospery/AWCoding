//
//  HTTPSessionManager.h
//  AWCoding
//
//  Created by 杨建祥 on 2018/2/28.
//  Copyright © 2018年 艾维科思. All rights reserved.
//

#import "JXHTTPSessionManager.h"

#define HTTPInstance              ([HTTPSessionManager sharedInstance])

@interface HTTPSessionManager : JXHTTPSessionManager
- (RACSignal *)requestWithPath:(NSString *)path param:(JXHTTPRequestParam *)param schema:(JXHTTPSchema *)schema class:(Class)cls tag:(NSInteger)tag isList:(BOOL)isList;

+ (instancetype)sharedInstance;
@end
