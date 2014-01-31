//
//  JPSAppDelegate.m
//  JPSImagePickerControllerDemo
//
//  Created by JP Simard on 1/31/2014.
//  Copyright (c) 2014 JP Simard. All rights reserved.
//

#import "JPSAppDelegate.h"
#import "JPSViewController.h"

@implementation JPSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [[JPSViewController alloc] init];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
