//
//  DDFooterView.h
//  16-group-buying
//
//  Created by 杜东方 on 15/11/13.
//  Copyright © 2015年 private. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DDFooterView;

//1.定义代理协议
@protocol DDFooterViewDelegate <NSObject>

- (void)footerViewDidClickedLoadMoreBtn:(DDFooterView*)footerView;

@end

@interface DDFooterView : UIView

//2.定义代理属性
@property(weak,nonatomic)id<DDFooterViewDelegate> delegate;

+(instancetype) footerView;

@end
