//
//  MJQDViewController.m
//  MeiJuLover
//
//  Created by Mac on 2020/9/7.
//  Copyright © 2020 sport. All rights reserved.
//

#import "MJQDViewController.h"
#import "LaunchView.h"
#import "PermissionUtils.h"
#import "MJNavigationController.h"
#import "MJHomeViewController.h"

@interface MJQDViewController ()

@property (nonatomic, strong) NSMutableArray *pictureArray;

@end

@implementation MJQDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = MainColor;
    [self bgViewSet];
}

- (void)bgViewSet {
    LaunchView *vc = [[LaunchView alloc] init];
    vc.title = @"内蒙古街拍";
    vc.subTitle = @"街拍App";
    vc.bgColor = MainColor;
    vc.fontColor = [UIColor whiteColor];
    vc.pictureArray = self.pictureArray;
    [self.view addSubview:vc];
    [vc mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [vc showView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"开 始 街 拍" forState:UIControlStateNormal];
    [button setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    button.layer.borderColor = UIColor.whiteColor.CGColor;
    [button addTarget:self action:@selector(jump:) forControlEvents:UIControlEventTouchUpInside];
    button.layer.borderWidth = 3.0f;
    [vc addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).offset(-100);
        make.centerX.equalTo(self.view);
        make.left.equalTo(self.view).offset(30);
        make.right.equalTo(self.view).offset(-30);
        make.height.mas_offset(45);
    }];
}


- (NSMutableArray *)pictureArray {
    if (!_pictureArray) {
        _pictureArray = [[NSMutableArray alloc] init];
        for (int i = 0; i < 8; i ++) {
            NSInteger idx = i + 1;
            NSString *name;
            if (idx > 9) {
                name = [NSString stringWithFormat:@"%ld",(long)idx];
            }else {
                name = [NSString stringWithFormat:@"0%ld",(long)idx];
            }
            [_pictureArray addObject:name];
        }
    }
    
    return _pictureArray;
}

- (void)jump:(UIButton *)sender {
    if ([PermissionUtils isAppHasCameraPermission]) {
        MJHomeViewController *vc = [[MJHomeViewController alloc] init];
        MJNavigationController *navi = [[MJNavigationController alloc] initWithRootViewController:vc];
        [UIApplication sharedApplication].keyWindow.rootViewController = navi;
    }
}

@end
