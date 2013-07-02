
#import "AppDelegate.h"
#import "DataModel/DataStack.h"
#import "API/API.h"
#import "debug.h"
#import "UncaughtExceptionHandler.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    if (DebugEnableUncaughtExceptionHandler) {
        InstallUncaughtExceptionHandler();
    }
    
    // TODO: 如有可能，需要把模块初始化置后
    [DataStack sharedInstance];
    [API sharedInstance];
    
    [self generalAppearanceSetup];
    return YES;
}

- (void)generalAppearanceSetup {
    id navigationBarAppearance = [UINavigationBar appearance];
    
    [navigationBarAppearance setBackgroundImage:[UIImage imageNamed:@"navigationBG"] forBarMetrics:UIBarMetricsDefault];
    
    // 导航栏标题定制
    [navigationBarAppearance setTitleTextAttributes:@{
              UITextAttributeTextColor : [UIColor colorWithRGBHex:0x2384d0],
        UITextAttributeTextShadowColor : [UIColor colorWithRGBHex:0xfff9fa]
     }];
    [navigationBarAppearance setTitleVerticalPositionAdjustment:2 forBarMetrics:UIBarMetricsDefault];
    
    // 导航栏按钮背景统一
    id apr = [UIBarButtonItem appearance];
    [apr setTintColor:[UIColor colorWithRGBHex:0x2384d0]];
    UIImage *bg = [[UIImage imageNamed:@"navigationBarButton"] resizableImageWithCapInsets:UIEdgeInsetsMake(1, 1, 1, 1)];
    [apr setBackgroundImage:bg forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [apr setBackButtonBackgroundImage:[UIImage imageNamed:@"navigationBarButton"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    // 如果想清空按钮背景，最好子类这些按钮然后清空该类按钮的背景
//    UIImage *blankImage = [UIImage imageNamed:@"blank2"];
//    [[FlatBarButtonItem appearance] setBackgroundImage:blankImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
//    [[FlatBarButtonItem appearance] setBackButtonBackgroundImage:blankImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    // 移除 iOS 6 多余的阴影
    if ([UINavigationBar instancesRespondToSelector:@selector(setShadowImage:)]) {
        [navigationBarAppearance setShadowImage:[[UIImage alloc] init]];
    }
    
    // Checkbox
//    id checkboxAppearance = [RFCheckBox appearance];
//    id checkboxAppearance2 = [RFCheckBox appearanceWhenContainedIn:[LoginViewController class], nil];
//    [checkboxAppearance setOnImage:[UIImage imageNamed:@"checkbox_on"]];
//    [checkboxAppearance2 setOnHighlightedImage:[UIImage imageNamed:@"checkbox_onHighlighted"]];
//    [checkboxAppearance setOnDisabledImage:[UIImage imageNamed:@"checkbox_onDisabled"]];
//    [checkboxAppearance setOffImage:[UIImage imageNamed:@"checkbox_off"]];
//    [checkboxAppearance2 setOffHighlightedImage:[UIImage imageNamed:@"checkbox_offHighlighted"]];
//    [checkboxAppearance setOffDisabledImage:[UIImage imageNamed:@"checkbox_offDisabled"]];
    
    // 刷新按钮
//    [[UIActivityIndicatorView appearanceWhenContainedIn:[RFRefreshButton class], nil] setColor:[UIColor colorWithRGBHex:0x2384d0]];
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

@end
