//
//  DDGroupBuyingCell.m
//  16-group-buying
//
//  Created by 杜东方 on 15/11/9.
//  Copyright © 2015年 private. All rights reserved.
//

#import "DDGroupBuyingCell.h"
#import "DDGroupBuying.h"

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

+ (instancetype)groupBuyingCellWithTableView:(UITableView *)tableView{
    static NSString *reuseId = @"group-buying";
    
    DDGroupBuyingCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    
    if (tableViewCell == nil) {
        //        tableViewCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseId];
        
        
        /**
         *  从xib中加载view,为了使用缓存，记得一定要把xib文件中得TableViewCell控件的identifier设置为:group-buying
         */
        tableViewCell = [[[NSBundle mainBundle] loadNibNamed:@"DDGroupBuying" owner:nil options:nil] lastObject];
        
        //加载xib另外一种方式
        //        UINib *nib = [UINib nibWithNibName:@"DDGroupBuying" bundle:nil];
        //        tableViewCell = [[nib instantiateWithOwner:nil options:nil] lastObject];
        
        
    }
    
    return tableViewCell;

}

- (void)setGroupBuying:(DDGroupBuying *)groupBuying{
    _groupBuying = groupBuying;
    self.iconImageView.image = [UIImage imageNamed:groupBuying.icon];
    self.titleLabelView.text = groupBuying.title;
    self.priceLabelView.text = [NSString stringWithFormat:@"￥ %@",groupBuying.price];
    self.buyCountLabelView.text = [NSString stringWithFormat:@"%@ 人购买",groupBuying.buyCount];
    
}

@end
