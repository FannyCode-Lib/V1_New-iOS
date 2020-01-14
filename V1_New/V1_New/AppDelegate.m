//
//  AppDelegate.m
//  V1_New
//
//  Created by Andy on 2020/1/11.
//  Copyright © 2020 Andy. All rights reserved.
//

#import "AppDelegate.h"
#import "LXNavigationViewController.h"
#import "LXMainTabBarViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //设置主视图
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    LXMainTabBarViewController *mainTabBarVC = [[LXMainTabBarViewController alloc] init];
    self.mainTabbar = mainTabBarVC;
    self.window.rootViewController = mainTabBarVC;
    return YES;
}

@end
