//
//  DDMicroBlogCell.h
//  17_weibo
//
//  Created by 杜东方 on 15/11/14.
//  Copyright © 2015年 private. All rights reserved.
//

#import <UIKit/UIKit.h>


@class DDMicroBlogFrame;

@interface DDMicroBlogCell : UITableViewCell

@property(nonatomic,strong)DDMicroBlogFrame *microBlogFrame;

+(instancetype)micronBlogCellWithTableView:(UITableView *)tableView;


@end
