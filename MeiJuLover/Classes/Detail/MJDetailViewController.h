//
//  MJDetailViewController.h
//  MeiJuLover
//
//  Created by Mac on 2020/9/7.
//  Copyright © 2020 sport. All rights reserved.
//

#import "MJBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MJDetailViewController : MJBaseViewController

@property (nonatomic, copy) NSString *picName;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, copy) NSString *content;

@end

NS_ASSUME_NONNULL_END
