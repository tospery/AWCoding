//
//  CoinViewModel.h
//  AWCoding
//
//  Created by 杨建祥 on 2018/3/1.
//  Copyright © 2018年 艾维科思. All rights reserved.
//

#import "JXMRCTableViewModel.h"

@interface CoinViewModel : JXMRCTableViewModel
@property (nonatomic, strong) NSString *amount;
@property (nonatomic, strong) RACCommand *amountCommand;
@property (nonatomic, strong) RACCommand *aboutCommand;

@end
