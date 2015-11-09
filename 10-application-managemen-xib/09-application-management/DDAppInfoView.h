//
//  DDAppInfoView.h
//  09-application-management
//
//  Created by 杜东方 on 15/10/31.
//  Copyright © 2015年 private. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DDAppInfo;
@class DDAppInfoView;

//1.定义代理协议
@protocol DDAppInfoViewDelegate <NSObject>

@optional
- (void) appInfoViewDidClickedDownload:(DDAppInfoView*)appInfoView;


@end

@interface DDAppInfoView : UIView



@property(nonatomic,strong)DDAppInfo *appInfo;

//2.定义代理属性
@property(nonatomic,weak)id<DDAppInfoViewDelegate> delegate;

+ (instancetype)appInfoView;

@end
