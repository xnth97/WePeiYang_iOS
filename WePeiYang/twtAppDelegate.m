//
//  twtAppDelegate.m
//  WePeiYang
//
//  Created by Qin Yubo on 13-11-28.
//  Copyright (c) 2013年 Qin Yubo. All rights reserved.
//

#import "WePeiYang-Swift.h"
#import "twtAppDelegate.h"
#import "data.h"
#import "twtSecretKeys.h"
#import "twtSDK.h"
#import "MK-Swift.h"
#import "UINavigationController+JZExtension.h"

@class SideNavigationViewController;

@implementation twtAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self.window setBackgroundColor:[UIColor whiteColor]];
    
    [WXApi registerApp:[twtSecretKeys getWechatAppId]];
    
    // Set NSURLCache
    NSURLCache *sharedCache = [[NSURLCache alloc]initWithMemoryCapacity:2 * 1024 * 1024 diskCapacity:30 * 1024 * 1024 diskPath:nil];
    [NSURLCache setSharedURLCache:sharedCache];
    
    [twtSDK setAppKey:[twtSecretKeys getTWTAppKey] appSecret:[twtSecretKeys getTWTAppSecret]];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    MainViewController *mainController = [[MainViewController alloc] initWithNibName:nil bundle:nil];
    SidebarViewController *sidebarController = [[SidebarViewController alloc] initWithNibName:nil bundle:nil];
    SideNavigationViewController *sideNav = [[SideNavigationViewController alloc] initWithMainViewController:mainController sideViewController:sidebarController];
    sideNav.automaticallyAdjustsScrollViewInsets = NO;
    sideNav.wantsNavigationBarVisible = NO;
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:sideNav];
    navigationController.view.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    return [WXApi handleOpenURL:url delegate:self];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [WXApi handleOpenURL:url delegate:self];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

// 关于后台挂起

//- (BOOL)application:(UIApplication *)application shouldSaveApplicationState:(NSCoder *)coder
//{
//    return YES;
//}
//
//- (BOOL)application:(UIApplication *)application shouldRestoreApplicationState:(NSCoder *)coder
//{
//    return YES;
//}
//
//- (void)application:(UIApplication *)application willEncodeRestorableStateWithCoder:(NSCoder *)coder {
//
//}
//
//- (void)application:(UIApplication *)application didDecodeRestorableStateWithCoder:(NSCoder *)coder {
//    
//}

// WeChat Delegate

- (void)onReq:(BaseReq *)req {
    
}

- (void)onResp:(BaseResp *)resp {
    
}

@end
