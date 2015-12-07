//
//  DDFriendGroupHeaderView.h
//  21_qq_frinends
//
//  Created by 杜东方 on 15/11/17.
//  Copyright © 2015年 private. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DDFriendGroup,DDFriendGroupHeaderView;

@protocol DDFriendGroupHeaderViewDelegate <NSObject>

@optional

-(void)headerViewDidClickedNameView:(DDFriendGroupHeaderView *)headerView;

@end

@interface DDFriendGroupHeaderView : UITableViewHeaderFooterView

@property(nonatomic,strong)DDFriendGroup *friendGroup;
@property(nonatomic,weak)id<DDFriendGroupHeaderViewDelegate> delegate;

+(instancetype)friendGroupHeaderViewWithTableView:(UITableView *)tableView;

@end
