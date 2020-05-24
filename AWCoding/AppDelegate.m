//
//  AppDelegate.m
//  AWCoding
//
//  Created by 杨建祥 on 2018/2/27.
//  Copyright © 2018年 艾维科思. All rights reserved.
//

#import "AppDelegate.h"
#import "JXObjc.h"

@interface AppDelegate ()
@property (nonatomic, strong, readwrite) LoginViewModel *loginViewModel;
@property (nonatomic, strong, readwrite) MainViewModel *mainViewModel;

@end

@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [VendorInstance setupIQKeyboardManager];
    [VendorInstance setupAFNetworking];
    
    [self customJXObjc];
    [self customAppearance];
    [self customApplication];
    [self initData];
    [self setupPlatform:launchOptions];
    [self acquirePermission];
    
    @weakify(self)
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        @strongify(self)
        [self test];
    });
    
    return YES;
}

- (void)test {
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    [ArchiveInstance setObject:gUser forKey:kJXTMUser];
    [ArchiveInstance setObject:gMisc forKey:kJXTMMisc];
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    JXLogInfo(@"disk = %@", NSHomeDirectory());
    JXLogInfo(@"token = %@", gUser.token);
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [ArchiveInstance setObject:gUser forKey:kJXTMUser];
    [ArchiveInstance setObject:gMisc forKey:kJXTMMisc];
}

#pragma mark - Custom
#pragma mark accessor
- (UIWindow *)window {
    if (!_window) {
        _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        _window.backgroundColor = [UIColor whiteColor];
    }
    return _window;
}

- (LoginViewModel *)loginViewModel {
    if (!_loginViewModel) {
        _loginViewModel = [[LoginViewModel alloc] initWithData:nil];
    }
    return _loginViewModel;
}

- (MainViewModel *)mainViewModel {
    if (!_mainViewModel) {
        _mainViewModel = [[MainViewModel alloc] initWithData:nil];
    }
    return _mainViewModel;
}

#pragma mark assist
- (void)customJXObjc {
    JXInstance.statusBarStyle = JXStatusBarStyleDefault;
    JXInstance.mainColor = SkinInstance.mainColor;
    JXInstance.viewBgColor = SkinInstance.viewBgColor;
    JXInstance.navTintColor = SkinInstance.navTintColor;
    JXInstance.navItemColor = SkinInstance.navItemColor;
    JXInstance.mustLogin = YES;
    
    RACTuple *dev = RACTuplePack(@"https://coding.net", @"api");
    RACTuple *hoc = RACTuplePack(@"https://coding.net", @"api");
    RACTuple *app = RACTuplePack(@"https://coding.net", @"api");
    JXInstance.servers = RACTuplePack(dev, hoc, app);
}

- (void)customAppearance {
    [UINavigationBar jx_appearanceWithParam:@{kJXKeyTranslucent: @NO, kJXKeyBarTintColor: SkinInstance.navTintColor, kJXKeyTitleColor: SkinInstance.navItemColor, kJXKeyTitleFont: [UIFont systemFontOfSize:17]}];
    [UIBarButtonItem jx_appearanceWithParam:@{kJXKeyTitleColor: SkinInstance.navItemColor, kJXKeyTitleColorDisabled: [UIColor lightTextColor], kJXKeyTitleFont: [UIFont systemFontOfSize:16]}];
    [UITabBar jx_appearanceWithParam:@{kJXKeyTranslucent: @NO, kJXKeyTintColor: SkinInstance.tabItemSelectedColor}];
}

- (void)customApplication {
    //    [NSURLProtocol registerClass:[JXURLProtocol class]];
    //    [JXURLProtocol setCachingEnabled:YES];
    //
    //    NSString *userAgent = JXStrWithFmt(@"simu-tech.com/app/ios/%@_v%@", [JXApp identifier], [JXApp version]);
    //    [UIWebView jx_setupUserAgent:userAgent];
}

- (void)initData {
    //self.navigationStack = [[JXNavigationStack alloc] initWithService:NavService];
    // NavStack;
    
    // 获取本地基础数据
    gUser = [ArchiveInstance objectForKey:kJXTMUser];
    if (!gUser) {
        gUser = [User new];
    }
    // gUser.isLogined = YES;
    
    gMisc = [ArchiveInstance objectForKey:kJXTMMisc];
    if (!gMisc) {
        gMisc = [Misc new];
    }
    
#ifdef JXEnableEnvDev
    gMisc.baseURLString = [(RACTuple *)JXInstance.servers.first first];
    gMisc.pathURLString = [(RACTuple *)JXInstance.servers.first second];
//    gMisc.kIMAppId = @"1400016498";
//    gMisc.kUMessageAppKey = @"5875ea31677baa13d6000133";
//    gMisc.kUMessageAppSecret = @"shzxkx8kr4onj1vqgt1425t5khqse9dt";
#elif defined(JXEnableEnvHoc)
    gMisc.baseURLString = [(RACTuple *)JXInstance.servers.second first];
    gMisc.pathURLString = [(RACTuple *)JXInstance.servers.second second];
    //    gMisc.kIMAppId = @"1400016498";
    //    gMisc.kUMessageAppKey = @"5875ea31677baa13d6000133";
    //    gMisc.kUMessageAppSecret = @"shzxkx8kr4onj1vqgt1425t5khqse9dt";
#else
    gMisc.baseURLString = [(RACTuple *)JXInstance.servers.third first];
    gMisc.pathURLString = [(RACTuple *)JXInstance.servers.third second];
//    gMisc.kIMAppId = @"1400016593";
//    gMisc.kUMessageAppKey = @"5875ea31677baa13d6000133";
//    gMisc.kUMessageAppSecret = @"shzxkx8kr4onj1vqgt1425t5khqse9dt";
#endif
    
    
    //    self.services = [[JXNavigationService alloc] init];
    //    self.navigationControllerStack = [[JXNavigationStack alloc] initWithServices:self.services];
    // self.services.appStoreService requestAppInfoFromAppStoreWithAppID:<#(NSString *)#>
    
    
    //    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    //    self.window.backgroundColor = [UIColor whiteColor];
    //    [self.services resetRootViewModel:[self createInitialViewModel]];
    //    [self.window makeKeyAndVisible];
    
    [[RACObserve(gUser, isLogined) distinctUntilChanged] subscribeNext:^(NSNumber *isLogined) {
        if (JXInstance.mustLogin) {
            if (!isLogined.boolValue) {
                [self entryLogin];
            }else {
                [self entryMain];
            }
        }else {
            [self entryMain];
        }
    }];
}

- (void)acquirePermission {
    //    [JXPermissionManager acquireCamera];
    //    [JXPermissionManager acquirePhotoAlbum];
}

- (void)setupPlatform:(NSDictionary *)launchOptions {
    
}


#pragma mark public
- (void)entryLogin {
    [MRCNavService resetRootViewModel:self.loginViewModel];
    [self.window makeKeyAndVisible];
}

- (void)entryMain {
    BOOL needClean = YES;
    
    if (JXInstance.mustLogin) {
        
    }else {
        // YJX_TODO
    }
    
    if (needClean && _mainViewModel) {
        _mainViewModel = nil;
    }
    
//    if (gUser.id.length == 0) {
//        if (gMisc.prevUserID.length != 0) {
//            need = NO;
//        }
//    }else {
//        if (gMisc.prevUserID.length != 0 &&
//            [gUser.id isEqualToString:gMisc.prevUserID]) {
//            need = NO;
//        }
//    }
//
//    if (!need && self.window.rootViewController) {
//        return;
//    }
    
    // _mainViewModel = nil;
    
    //    NSString *a = nil;
    //    NSString *b = nil;
    //
    //    if ([a isEqualToString:b]) {
    //        int cc = 0;
    //    }
    //
    //    if (gUser.id.length == 0) {
    //        _mainViewModel = nil;
    //    }
    //
    //    if (gUser.id.length != 0 &&
    //        gMisc.prevUserID.length != 0 &&
    //        (![gUser.id isEqualToString:gMisc.prevUserID])) {
    //        _mainViewModel = nil;
    //    }
    
    //    if (self.window.rootViewController) {
    //        CATransition *animation = [CATransition animation];
    //        animation.delegate = (id<CAAnimationDelegate>)self;
    //        animation.duration = 0.5;
    //        animation.timingFunction =  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    //        animation.type = kCATransitionFade;
    //        NSUInteger pre = [self.window.subviews indexOfObject:self.window.rootViewController.view];
    //        NSUInteger cur = [self.window.subviews indexOfObject:self.mainTB.view];
    //        [self.window exchangeSubviewAtIndex:pre withSubviewAtIndex:cur];
    //        [self.window.layer addAnimation:animation forKey:kJXAnimRootController];
    //
    //        @weakify(self)
    //        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    //            @strongify(self)
    //            self.loginNC = nil;
    //        });
    //    }
    
    [MRCNavService resetRootViewModel:self.mainViewModel];
    [self.window makeKeyAndVisible];
    
    @weakify(self)
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        @strongify(self)
        self->_loginViewModel = nil;
    });
}

#pragma mark - Delegate
#pragma mark - Class

@end








