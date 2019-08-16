//
//  RootViewController.m
//  iOSPlayground
//
//  Created by siming gao on 2019/8/8.
//  Copyright © 2019 gaosiming. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (instancetype) init  {
    
    if (self = [super init]) {
        
        [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor redColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:15], NSFontAttributeName, nil] forState:UIControlStateNormal];
        [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blueColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:25] , NSFontAttributeName, nil] forState:UIControlStateSelected];
         
        
//        添加子控制器
        UIViewController *vc1 = [[UIViewController alloc] init];
        vc1.view.backgroundColor = [UIColor redColor];
        //设置标题
        vc1.tabBarItem.title = @"标题1";
        vc1.tabBarItem.badgeColor= [UIColor blackColor];
        //设置提醒数字
        vc1.tabBarItem.badgeValue = @"10";
        
        UIViewController *vc2 = [[UIViewController alloc] init];
        vc2.view.backgroundColor = [UIColor greenColor];
        vc2.tabBarItem.badgeColor= [UIColor yellowColor];
        //设置标题
        vc2.tabBarItem.title = @"标题2";
        //设置提醒数字
        vc2.tabBarItem.badgeValue = @"20";
        
        
    
        
        //添加子控制器.
//        [self addChildViewController:vc1];
//        [self addChildViewController:vc2];
        
        //或添加子控制器.
        self.viewControllers=@[vc1,vc2 ];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
