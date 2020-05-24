//
//  MainViewModel.h
//  AWCoding
//
//  Created by 杨建祥 on 2018/2/27.
//  Copyright © 2018年 艾维科思. All rights reserved.
//

#import "JXMRCTabBarViewModel.h"

@interface MainViewModel : JXMRCTabBarViewModel
@property (nonatomic, strong, readonly) ProjectViewModel *projectViewModel;
@property (nonatomic, strong, readonly) TaskViewModel *taskViewModel;
@property (nonatomic, strong, readonly) TweetViewModel *tweetViewModel;
@property (nonatomic, strong, readonly) MessageViewModel *messageViewModel;
@property (nonatomic, strong, readonly) MineViewModel *mineViewModel;

@end
