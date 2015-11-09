//
//  DDLabel.m
//  09-application-management
//
//  Created by 杜东方 on 15/11/7.
//  Copyright © 2015年 private. All rights reserved.
//

#import "DDLabel.h"

@implementation DDLabel


+ (void)showLabel:(UIView*)parentView withAppInfoName:(NSString*)appInfoName
{
    //提示正在下载
    UILabel *tipLabelView = [[UILabel alloc] init];
    [parentView addSubview:tipLabelView];
    tipLabelView.text = [NSString stringWithFormat:@"正在下载:%@",appInfoName];
    
    //设置frame
    CGFloat tipW = 150;
    CGFloat tipH = 25;
    CGFloat tipX = (parentView.frame.size.width - tipW) / 2;
    CGFloat tipY = (parentView.frame.size.height - tipH) / 2;
    
    tipLabelView.frame = CGRectMake(tipX, tipY, tipW, tipH);
    
    tipLabelView.backgroundColor = [UIColor grayColor];
    tipLabelView.textAlignment = NSTextAlignmentCenter;
    
    //透明度
    tipLabelView.alpha = 0;
    
    //设置圆角
    tipLabelView.layer.cornerRadius = 10;
    tipLabelView.layer.masksToBounds = YES;//裁剪超过bounds的部分
    
    
    //加入动画
    [UIView animateWithDuration:1 animations:^{
        tipLabelView.alpha = 0.9;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1 delay:3 options:UIViewAnimationOptionCurveLinear animations:^{
            tipLabelView.alpha = 0;
        } completion:^(BOOL finished) {
            [tipLabelView removeFromSuperview];
            parentView.userInteractionEnabled = YES;
        }];
    }];

}

@end
