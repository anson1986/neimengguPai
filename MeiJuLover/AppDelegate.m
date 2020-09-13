//
//  AppDelegate.m
//  MeiJuLover
//
//  Created by bifen on 2020/7/4.
//  Copyright © 2020 sport. All rights reserved.
//

#import "AppDelegate.h"
#import "MJQDViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    MJQDViewController *vc = [MJQDViewController new];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
    return YES;
}



@end
