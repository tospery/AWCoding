//
//  MainViewController.m
//  AWCoding
//
//  Created by 杨建祥 on 2018/2/27.
//  Copyright © 2018年 艾维科思. All rights reserved.
//

#import "MainViewController.h"
#import "ProjectViewController.h"
#import "TaskViewController.h"
#import "TweetViewController.h"
#import "MessageViewController.h"
#import "MineViewController.h"

@interface MainViewController ()
@property (nonatomic, strong, readwrite) MainViewModel *viewModel;

@end

@implementation MainViewController
@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *controllers = @[[[ProjectViewController alloc] initWithViewModel:self.viewModel.projectViewModel],
                     [[TaskViewController alloc] initWithViewModel:self.viewModel.taskViewModel],
                     [[TweetViewController alloc] initWithViewModel:self.viewModel.tweetViewModel],
                     [[MessageViewController alloc] initWithViewModel:self.viewModel.messageViewModel],
                     [[MineViewController alloc] initWithViewModel:self.viewModel.mineViewModel]];
    NSArray *images = @[@"project", @"task", @"tweet", @"privatemessage", @"me"];
    NSArray *titles = @[@"项目", @"任务", @"冒泡", @"消息", @"我"];
    
    NSMutableArray *results = [NSMutableArray arrayWithCapacity:controllers.count];
    for (NSInteger i = 0; i < controllers.count; ++i) {
        UIImage *nImage = JXImageWithName(JXStrWithFmt(@"%@_normal", images[i]));
        UIImage *sImage = JXImageWithName(JXStrWithFmt(@"%@_selected", images[i]));
        UIViewController *vc = controllers[i];
        [vc.tabBarItem jx_configWithParam:@{kJXKeyTitleText: titles[i], kJXKeyTitleColor:SkinInstance.tabItemColor, kJXKeyTitleColorSelected: SkinInstance.tabItemSelectedColor, kJXKeyImage: nImage, kJXKeyImageSelected: sImage}];
        [results addObject:[[JXNavigationController alloc] initWithRootViewController:vc]];
    }
    
//    ProjectViewController *project = [[ProjectViewController alloc] initWithViewModel:self.viewModel.projectViewModel];
//    project.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:JXImageWithName(@"nav_good") selectedImage:JXImageWithName(@"nav_goodCur")];
//    JXNavigationController *projectNC = [[JXNavigationController alloc] initWithRootViewController:project];
//
//    TaskViewController *task = [[TaskViewController alloc] initWithViewModel:self.viewModel.taskViewModel];
//    task.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:JXImageWithName(@"nav_user") selectedImage:JXImageWithName(@"nav_userCur")];
//    JXNavigationController *taskNC = [[JXNavigationController alloc] initWithRootViewController:task];
//
//    TweetViewController *tweet = [[TweetViewController alloc] initWithViewModel:self.viewModel.tweetViewModel];
//    tweet.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:JXImageWithName(@"nav_user") selectedImage:JXImageWithName(@"nav_userCur")];
//    JXNavigationController *tweetNC = [[JXNavigationController alloc] initWithRootViewController:tweet];
//
//    MessageViewController *message = [[MessageViewController alloc] initWithViewModel:self.viewModel.messageViewModel];
//    message.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:JXImageWithName(@"nav_user") selectedImage:JXImageWithName(@"nav_userCur")];
//    JXNavigationController *messageNC = [[JXNavigationController alloc] initWithRootViewController:message];
//
//    MineViewController *mine = [[MineViewController alloc] initWithViewModel:self.viewModel.mineViewModel];
//    mine.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:JXImageWithName(@"nav_user") selectedImage:JXImageWithName(@"nav_userCur")];
//    JXNavigationController *mineNC = [[JXNavigationController alloc] initWithRootViewController:mine];
//
    
    self.tabBarController.viewControllers = results;
    [MRCNavStack pushNavigationController:results[0]];
    
    [[self
      rac_signalForSelector:@selector(tabBarController:didSelectViewController:)
      fromProtocol:@protocol(UITabBarControllerDelegate)]
     subscribeNext:^(RACTuple *tuple) {
         [MRCNavStack popNavigationController];
         [MRCNavStack pushNavigationController:tuple.second];
     }];
    self.tabBarController.delegate = self;
}


- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    //    if (self.tabBarController.selectedViewController == viewController) {
    //        UINavigationController *navigationController = (UINavigationController *)self.tabBarController.selectedViewController;
    //        UIViewController *viewController = navigationController.topViewController;
    //        if ([viewController isKindOfClass:[HomeViewController class]]) {
    //            HomeViewController *newsViewController = (HomeViewController *)viewController;
    //            [newsViewController refresh];
    //        }
    //    }
    return YES;
}
@end
