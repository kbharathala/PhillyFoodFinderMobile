//
//  AppDelegate.m
//  PhillyFoodFinderMobile
//
//  Created by Krishna Bharathala on 9/10/16.
//  Copyright © 2016 Krishna Bharathala. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()
@property (nonatomic, strong) UINavigationController *navController;
@property (nonatomic, strong) ViewController *viewController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.viewController = [[ViewController alloc] init];
    
    self.navController = [[UINavigationController alloc] initWithRootViewController:self.viewController];
    self.navController.navigationBarHidden = NO;
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = self.navController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
