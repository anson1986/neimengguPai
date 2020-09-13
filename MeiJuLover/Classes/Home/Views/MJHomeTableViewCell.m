//
//  MJHomeTableViewCell.m
//  MeiJuLover
//
//  Created by Mac on 2020/9/7.
//  Copyright © 2020 sport. All rights reserved.
//

#import "MJHomeTableViewCell.h"

@interface MJHomeTableViewCell ()

@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) UIImageView *iconImgView;

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation MJHomeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self lineView];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_lineView];
        
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self).offset(0);
            make.height.mas_offset(0.5f);
        }];
    }
    return _lineView;
}

- (UIImageView *)iconImgView {
    if (!_iconImgView) {
        _iconImgView = [UIImageView new];
        _iconImgView.layer.masksToBounds = YES;
        _iconImgView.layer.cornerRadius = 50/2;
        _iconImgView.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:_iconImgView];
        
        [_iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(30);
            make.width.height.mas_offset(50);
            make.centerY.equalTo(self);
        }];
    }
    
    return _iconImgView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:_titleLabel];
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconImgView.mas_right).offset(30);
            make.centerY.equalTo(self);
        }];
    }
    return _titleLabel;
}

- (void)setImgName:(NSString *)imgName {
    _imgName = imgName;
    self.iconImgView.image = [UIImage imageNamed:imgName];
}

- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = title;
}

@end
