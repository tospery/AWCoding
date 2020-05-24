//
//  MainViewModel.m
//  AWCoding
//
//  Created by 杨建祥 on 2018/2/27.
//  Copyright © 2018年 艾维科思. All rights reserved.
//

#import "MainViewModel.h"

@interface MainViewModel ()
@property (nonatomic, strong, readwrite) ProjectViewModel *projectViewModel;
@property (nonatomic, strong, readwrite) TaskViewModel *taskViewModel;
@property (nonatomic, strong, readwrite) TweetViewModel *tweetViewModel;
@property (nonatomic, strong, readwrite) MessageViewModel *messageViewModel;
@property (nonatomic, strong, readwrite) MineViewModel *mineViewModel;

@end

@implementation MainViewModel
- (void)initialize {
    [super initialize];
    
    self.projectViewModel = [[ProjectViewModel alloc] initWithData:nil];
    self.taskViewModel = [[TaskViewModel alloc] initWithData:nil];
    self.tweetViewModel = [[TweetViewModel alloc] initWithData:nil];
    self.messageViewModel = [[MessageViewModel alloc] initWithData:nil];
    self.mineViewModel = [[MineViewModel alloc] initWithData:nil];
}

@end
