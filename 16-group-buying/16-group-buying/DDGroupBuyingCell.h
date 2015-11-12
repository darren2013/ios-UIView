//
//  DDGroupBuyingCell.h
//  16-group-buying
//
//  Created by 杜东方 on 15/11/9.
//  Copyright © 2015年 private. All rights reserved.
//

/**
 *  注意：为了让xib中自定义控件能够连线到这里自定义cell,必须更改xib中UITableViewCell customClass为：DDGroupBuyingCell
 */

#import <UIKit/UIKit.h>
@class DDGroupBuying;

@interface DDGroupBuyingCell : UITableViewCell

@property(nonatomic,strong)DDGroupBuying *groupBuying;

+(instancetype) groupBuyingCellWithTableView:(UITableView*)tableView;


@end
