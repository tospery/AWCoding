//
//  User.m
//  AWCoding
//
//  Created by 杨建祥 on 2018/2/27.
//  Copyright © 2018年 艾维科思. All rights reserved.
//

#import "User.h"

@implementation User
+ (NSDictionary *)mj_objectClassInArray {
    return @{@"skills": [Skill class]};
}

@end
