//
//  DDMessageCell.h
//  18_qq
//
//  Created by 杜东方 on 15/11/15.
//  Copyright © 2015年 private. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DDMessageFrame;


@interface DDMessageCell : UITableViewCell

+(instancetype)messageCellWithTableView:(UITableView*)tableView;

@property(nonatomic,strong)DDMessageFrame *messageFrame;


@end
