//
//  MJNavigationController.m
//  MeiJuLover
//
//  Created by bifen on 2020/7/4.
//  Copyright © 2020 sport. All rights reserved.
//

#import "MJNavigationController.h"

@interface MJNavigationController ()

@end

@implementation MJNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationBar setTranslucent:NO];
     self.navigationBar.barStyle = UIBarStyleBlackOpaque;
     self.navigationBar.barTintColor = MainColor;
     self.navigationBar.tintColor = [UIColor whiteColor];
     [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
     self.navigationBar.translucent = NO;
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
