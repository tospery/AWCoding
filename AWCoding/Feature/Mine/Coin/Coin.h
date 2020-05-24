//
//  Coin.h
//  AWCoding
//
//  Created by 杨建祥 on 2018/3/1.
//  Copyright © 2018年 艾维科思. All rights reserved.
//

#import "JXArchiveObject.h"

@interface Coin : JXArchiveObject
@property (nonatomic, assign) NSInteger action;         // 1
@property (nonatomic, assign) CGFloat points_change;    // 0.1
@property (nonatomic, assign) CGFloat points_left;      // 0.41
@property (nonatomic, copy) NSString *usage;            // 生日送码币
@property (nonatomic, copy) NSString *remark;           // 生日送码币
@property (nonatomic, strong) NSDate *created_at;       // 1466611214000

@end
