//
//  AppDelegate.m
//  MCMS
//
//  Created by teacher on 5/20/14.
//  Copyright (c) 2014 Mathien. All rights reserved.
//

#import "AppDelegate.h"
#import <CheckMate/CheckMate.h>


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [CheckMate initializeFramework:@[@"a102998cf0241f47cdbd3e3cfe885a44", @"e1fb14a9a04598be2ee67883545ce92b"]];
    return YES;
}
							


@end
