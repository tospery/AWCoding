//
//  HTTPSessionManager+Tweet.h
//  AWCoding
//
//  Created by 杨建祥 on 2018/3/2.
//  Copyright © 2018年 艾维科思. All rights reserved.
//

#import "HTTPSessionManager.h"

@interface HTTPSessionManager (Tweet)
- (RACSignal *)user_tweet:(NSInteger)last_id;

@end
