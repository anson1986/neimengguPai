//
//  MJHomeTableViewCell.h
//  MeiJuLover
//
//  Created by Mac on 2020/9/7.
//  Copyright © 2020 sport. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MJHomeTableViewCell : UITableViewCell

@property (nonatomic, strong) NSMutableArray *array;

@property (nonatomic, copy) NSString *imgName;

@property (nonatomic, copy) NSString *title;

@end

NS_ASSUME_NONNULL_END
