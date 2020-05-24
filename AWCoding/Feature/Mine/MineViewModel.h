//
//  MineViewModel.h
//  AWCoding
//
//  Created by 杨建祥 on 2018/2/27.
//  Copyright © 2018年 艾维科思. All rights reserved.
//

#import "JXMRCViewModel.h"

@interface MineViewModel : JXMRCScrollViewModel
@property (nonatomic, strong) RACCommand *userCommand;
@property (nonatomic, strong) RACCommand *itemCommand;

@end
