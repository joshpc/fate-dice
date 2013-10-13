//
//  JTAppDelegate.m
//  FateDice
//
//  Created by Joshua Tessier on 2013-10-13.
//  Copyright (c) 2013 Joshua Tessier. All rights reserved.
//

#import "JTAppDelegate.h"

//Controller
#import "JTDiceController.h"

@implementation JTAppDelegate {
	JTDiceController *_diceController;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	_diceController = [[JTDiceController alloc] init];
	
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	[self.window setRootViewController:_diceController];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
