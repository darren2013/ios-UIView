//
//  DDAppInfoView.h
//  09-application-management
//
//  Created by 杜东方 on 15/10/31.
//  Copyright © 2015年 private. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DDAppInfo;

@interface DDAppInfoView : UIView



@property(nonatomic,strong)DDAppInfo *appInfo;

+ (instancetype)appInfoView;

@end
