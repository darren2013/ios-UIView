//
//  ViewController.m
//  09-application-management
//
//  Created by 杜东方 on 15/10/31.
//  Copyright © 2015年 private. All rights reserved.
//

#import "ViewController.h"
#import "DDAppInfo.h"

@interface ViewController ()

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
        UIView *subView = [[UIView alloc] init];
        [self.view addSubview:subView];
        
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
        
        [self displayAppInfo:appInfo onSubView:subView];
        
        
    }
}


- (void) displayAppInfo:(DDAppInfo*)appInfo onSubView:(UIView*)subView{
    //生成3个子控件
    
    //4.1生成图标控件
    UIImage *iconImage = [UIImage imageNamed:appInfo.icon];
    //UIImageView *iconView = [[UIImageView alloc] init];
    //[iconView setImage:iconImage];
    UIImageView *iconView = [[UIImageView alloc] initWithImage:iconImage];
    [subView addSubview:iconView];
    CGFloat iconW = 60;
    CGFloat iconH = 60;
    CGFloat iconX = (subView.frame.size.width - iconW) / 2;
    CGFloat iconY = 0;
    iconView.frame = CGRectMake(iconX, iconY, iconW, iconH);
    
    CGFloat subViewW = subView.frame.size.width;
    
    
    //4.2生成文字
    UILabel *nameLabel = [[UILabel alloc] init];
    [subView addSubview:nameLabel];
    
    CGFloat nameW = subViewW;
    CGFloat nameH = 20;
    CGFloat nameX = 0;
    CGFloat nameY = iconH;
    nameLabel.frame = CGRectMake(nameX, nameY, nameW, nameH);
    nameLabel.text = appInfo.name;
    nameLabel.textAlignment = NSTextAlignmentCenter;
    nameLabel.font = [UIFont systemFontOfSize:15];
    
    //4.3生成下载按钮
    UIButton *downloadView = [UIButton buttonWithType:UIButtonTypeCustom];
    [subView addSubview:downloadView];
    
    //frame大小
    CGFloat downloadW = iconW;
    CGFloat downloadH = 20;
    CGFloat downloadX = iconX;
    //CGRectGetMaxY y坐标+高度
    CGFloat downloadY = CGRectGetMaxY(nameLabel.frame);
    downloadView.frame = CGRectMake(downloadX, downloadY, downloadW, downloadH);
    
    [downloadView setTitle:@"下载" forState:UIControlStateNormal];
    
    [downloadView setBackgroundImage: [UIImage imageNamed:@"buttongreen"] forState:UIControlStateNormal];
    [downloadView setBackgroundImage:[UIImage imageNamed:@"buttongreen_highlighted"] forState:UIControlStateHighlighted];
    downloadView.titleLabel.font = [UIFont systemFontOfSize:15];
    
    
    [downloadView addTarget:self action:@selector(downloadClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)downloadClick{
    NSLog(@"download button is clicked");
}

@end
