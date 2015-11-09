//
//  ViewController.m
//  09-application-management
//
//  Created by 杜东方 on 15/10/31.
//  Copyright © 2015年 private. All rights reserved.
//

/**
 *  xib相对于storyboard较为轻量级，可以用来构建控件，
 *  用于描述软件界面，一般用来描述软件界面的某一部分;
 controller尽量保持简单
 *  @param nonatomic <#nonatomic description#>
 *  @param strong    <#strong description#>
 *
 *  @return return value description
 */



#import "ViewController.h"
#import "DDAppInfo.h"
#import "DDAppInfoView.h"
#import "DDLabel.h"

@interface ViewController ()<DDAppInfoViewDelegate>

/**
 *  获取plist数据
 */
@property(nonatomic,strong)NSArray *appInfos;

@end

@implementation ViewController


- (NSArray *)appInfos
{
    /**
     *  注意appinfos获取，一定不要用self.appInfos,会死循环的
     */
    if (_appInfos == nil) {
        _appInfos = [DDAppInfo appInfoList];
    }
    
    return _appInfos;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",NSHomeDirectory());
    
    NSLog(@"%zd",self.appInfos.count);
    
    for (int i=0; i<self.appInfos.count; i++) {
       // UIView *subView = [[UIView alloc] init];
        
//        NSBundle *bundle = [NSBundle mainBundle];
//        DDAppInfoView *subView = [[bundle loadNibNamed:@"DDAppInfo" owner:nil options:nil] lastObject];
        
        DDAppInfoView *subView = [DDAppInfoView appInfoView];
        [self.view addSubview:subView];
        //设置代理对象
        subView.delegate = self;
        
        //计算frame
        CGFloat subViewW = 100;
        CGFloat subViewH = 100;
        
        
        CGFloat marginX = (self.view.frame.size.width - subViewW * 3) / 4;
        CGFloat marginY = 20;
        
        //当前view行号及列
        int row = i / 3;
        int column = i % 3;
        
        CGFloat subViewX = marginX + (marginX + subViewW)*column;
        CGFloat subViewY = 30 + (subViewW + marginY)*row;
        
        subView.frame = CGRectMake(subViewX, subViewY, subViewW, subViewH);
        
        //设置背景颜色
        //subView.backgroundColor = [UIColor redColor];
        
        DDAppInfo *appInfo = self.appInfos[i];
        
       // [self displayAppInfo:appInfo onSubView:subView];
        
        //给subView子控件赋值
        //第一种方式
//        UIImageView *uiImageView = subView.subviews[0];
//        [uiImageView setImage:[UIImage imageNamed:appInfo.icon]];
//        
//        //第二种方式
//        UILabel *nameLabel = [subView viewWithTag:10];
//        nameLabel.text = appInfo.name;
        
        //第三方法，使用自定view，推荐
//        [subView.iconView setImage:[UIImage imageNamed:appInfo.icon]];
//        subView.nameLabelView.text = appInfo.name;
        subView.appInfo = appInfo;
        
    }
}



- (void)appInfoViewDidClickedDownload:(DDAppInfoView *)appInfoView{
    [DDLabel showLabel:self.view withAppInfoName:appInfoView.appInfo.name];
}

@end
