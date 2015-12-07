//
//  DDAppInfoCell.h
//  22_appManagment
//
//  Created by 杜东方 on 15/11/21.
//  Copyright © 2015年 private. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AppInfo,DDAppInfoCell;

@protocol DDAppInfoCellDelegate <NSObject>

-(void)appInfoCellDownloadBtnDidClicked:(DDAppInfoCell*)appInfoCell;

@end

@interface DDAppInfoCell : UITableViewCell

@property(nonatomic,strong)AppInfo *appInfo;

@property(nonatomic,weak)id<DDAppInfoCellDelegate> delegate;

@end
