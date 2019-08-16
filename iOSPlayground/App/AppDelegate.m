//
//  AppDelegate.m
//  iOSPlayground
//
//  Created by 高思明 on 2019/6/22.
//  Copyright © 2019 gaosiming. All rights reserved.
//

#import "AppDelegate.h"
#import <Bugly/Bugly.h>
#import <AFNetworking/AFNetworking.h>
#import <CocoaLumberjack/CocoaLumberjack.h>


#ifdef DEBUG
static const DDLogLevel ddLogLevel = DDLogLevelVerbose;
#else
static const DDLogLevel ddLogLevel = DDLogLevelWarning;
#endif


@interface AppDelegate ()
@end

@implementation AppDelegate


- (void) initLogger
{
    [DDLog addLogger:[DDOSLogger sharedInstance]];
    DDFileLogger *fileLogger = [[DDFileLogger alloc] init];
    fileLogger.rollingFrequency=86400;//60*60*24;// 24 hour rolling
    fileLogger.logFileManager.maximumNumberOfLogFiles=7;
    [DDLog addLogger: fileLogger];
    DDLogVerbose(@"initLogger done!");
}

- (void) initBugly
{
    [Bugly startWithAppId:@"bdb0960067"];
    DDLogVerbose(@"initBugly done!");
}

- (BOOL) initViewController {
    if (!_rootVC) {
        _rootVC = [[RootViewController alloc] init];
    }
    if(!_rootVC){
        return NO;
    }
    
    _window.rootViewController = _rootVC;
    _rootVC.selectedIndex = 0;
    NSInteger idx = _rootVC.selectedIndex;
    UIViewController* vc = _rootVC.selectedViewController;
//    _rootVC.delegate = self;
    
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self initLogger];
    [self initBugly];
    

    return [self initViewController];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state.
    // This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message)
    // or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    NSInteger i = 1111;
//    int j =0;
    DDLogVerbose(@"application %@  Will enter background",@(i));
}

-(NSString *)getValueForKey:(NSString *)key
{
    NSData *valueData = [[NSData alloc] init];
    if(valueData != nil)
    {
        NSString *value = [[NSString alloc] initWithData:valueData encoding:NSUTF8StringEncoding];
        return value;
    }
     return key;
}

extern const unsigned char  sss[];

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers,
    // and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    NSLog(@"application didi enter background");
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    
    NSLog(@"application will enter foreground");
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    NSLog(@"application did became active");
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    
    NSLog(@"application will terminate");
}

@end
