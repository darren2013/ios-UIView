//
//  DDAppInfoView.m
//  09-application-management
//
//  Created by 杜东方 on 15/10/31.
//  Copyright © 2015年 private. All rights reserved.
//

#import "DDAppInfoView.h"
#import "DDAppInfo.h"





/**
 *  自定义view的属性一般写在类扩展里，不对外界暴露
 */
@interface DDAppInfoView()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabelView;

- (IBAction)downloadClick:(UIButton*)sender;


@end

@implementation DDAppInfoView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


+ (instancetype)appInfoView
{
    NSBundle *bundle = [NSBundle mainBundle];
    DDAppInfoView *subView = [[bundle loadNibNamed:@"DDAppInfo" owner:nil options:nil] lastObject];
    return subView;
}

- (void)setAppInfo:(DDAppInfo *)appInfo
{
    _appInfo = appInfo;
    
    self.iconView.image = [UIImage imageNamed:self.appInfo.icon];
    self.nameLabelView.text = self.appInfo.name;
    
}

- (IBAction)downloadClick:(UIButton*)sender {
    //取消和用户交互
    self.superview.userInteractionEnabled = NO;
    
    sender.enabled = NO;
    
    
    //3.向代理对象发送消息
    if ([self.delegate respondsToSelector:@selector(appInfoViewDidClickedDownload:)]) {
        [self.delegate appInfoViewDidClickedDownload:self];
    }
    
    
    
}
@end
