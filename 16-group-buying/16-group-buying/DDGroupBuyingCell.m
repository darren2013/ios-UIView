//
//  DDGroupBuyingCell.m
//  16-group-buying
//
//  Created by 杜东方 on 15/11/9.
//  Copyright © 2015年 private. All rights reserved.
//

#import "DDGroupBuyingCell.h"

@interface DDGroupBuyingCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabelView;
@property (weak, nonatomic) IBOutlet UILabel *priceLabelView;
@property (weak, nonatomic) IBOutlet UILabel *buyCountLabelView;

@end

@implementation DDGroupBuyingCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
