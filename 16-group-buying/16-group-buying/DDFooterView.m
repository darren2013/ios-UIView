//
//  DDFooterView.m
//  16-group-buying
//
//  Created by 杜东方 on 15/11/13.
//  Copyright © 2015年 private. All rights reserved.
//

#import "DDFooterView.h"

@interface DDFooterView()
@property (weak, nonatomic) IBOutlet UIButton *footerViewBtn;

- (IBAction)loadMoreBtnClick;
@property (weak, nonatomic) IBOutlet UIView *loadingView;

@end

@implementation DDFooterView


+ (instancetype)footerView{
    DDFooterView *footerView = [[[NSBundle mainBundle] loadNibNamed:@"DDFooterView" owner:nil options:nil] lastObject];
    footerView.footerViewBtn.layer.cornerRadius = 5;
    footerView.footerViewBtn
    .layer.masksToBounds = YES;
    return footerView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)loadMoreBtnClick {
    self.footerViewBtn.hidden = YES;
    self.loadingView.hidden = NO;
    
    
   //dispatch_after(<#dispatch_time_t when#>, <#dispatch_queue_t queue#>, <#^(void)block#>)
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.footerViewBtn.hidden = NO;
        self.loadingView.hidden = YES;
    });
}
@end
