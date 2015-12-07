//
//  ViewController.m
//  22_appManagment
//
//  Created by 杜东方 on 15/11/19.
//  Copyright © 2015年 private. All rights reserved.
//

#import "ViewController.h"
#import "AppInfo.h"
#import "DDAppInfoCell.h"

@interface ViewController ()<UITableViewDataSource,DDAppInfoCellDelegate>

@property(nonatomic,strong)NSArray *appInfos;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSArray *)appInfos{
    if (!_appInfos) {
        _appInfos = [AppInfo appInfoList];
    }
    
    return _appInfos;
}

#pragma mark --UITableView DataSource实现


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.appInfos.count;
}

/**
 *  storyboard的新特性，拿到一个cell后，缓存里如果没有，看看tableView是否在storyboard里，如果在
 则会去storyboard看看有没有动态的cell,有则创建一个
 *
 *  @param tableView <#tableView description#>
 *  @param indexPath <#indexPath description#>
 *
 *  @return <#return value description#>
 */
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSString *reuseId;
//    
//    if(indexPath.row % 2 == 0){
//        reuseId = @"appManagement";
//    }else{
//        reuseId = @"appManagement2";
//    }
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    
//    if (!cell) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseId];
//    }
    static NSString *reuseId = @"appManagement";
    DDAppInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    cell.appInfo = self.appInfos[indexPath.row];
    cell.delegate = self;
    return cell;
}

#pragma mark--appinfoCell 代理方法实现

/**
 *  添加subview应该是controll干得事，不应该交给cell
 *
 *  @param appInfoCell <#appInfoCell description#>
 */
-(void)appInfoCellDownloadBtnDidClicked:(DDAppInfoCell *)appInfoCell{
    UILabel *downloadInfo = [[UILabel alloc] initWithFrame:CGRectMake(80, 400, 200, 30)];
    downloadInfo.text = [NSString stringWithFormat:@"下载%@",appInfoCell.appInfo.name];
    downloadInfo.textAlignment = NSTextAlignmentCenter;
    downloadInfo.backgroundColor = [UIColor lightGrayColor];
    
    downloadInfo.alpha = 1.0;
    [self.view addSubview:downloadInfo];
    
    [UIView animateWithDuration:2.0 animations:^{
        downloadInfo.alpha = 0;
    } completion:^(BOOL finished) {
        [downloadInfo removeFromSuperview];
    }];
}
@end
