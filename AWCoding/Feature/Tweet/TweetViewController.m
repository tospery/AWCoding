//
//  TweetViewController.m
//  AWCoding
//
//  Created by 杨建祥 on 2018/2/27.
//  Copyright © 2018年 艾维科思. All rights reserved.
//

#import "TweetViewController.h"
#import "TweetViewModel.h"

@interface TweetViewController ()
@property (nonatomic, strong, readwrite) TweetViewModel *viewModel;
@property (nonatomic, weak) IBOutlet UIButton *testButton;

@end

@implementation TweetViewController
@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)bindViewModel {
    [super bindViewModel];
    
    self.testButton.rac_command = self.viewModel.testCommand;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
