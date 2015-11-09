//
//  ViewController.m
//  tableView-practise
//
//  Created by 杜东方 on 15/11/7.
//  Copyright © 2015年 private. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableView.dataSource = self;
}

- (BOOL)prefersStatusBarHidden{
    return YES;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //section是按照从0算得
    if (section == 0) {
        return 3;
    }else{
        return 2;
    }
    
}

//注意index都是从0开始的

/**
 *  UITableView cell上面会放置一个contentView是由4部分组成：
 UIImageView
 UITextLabel
 UIDetailTextLabel
 还有一个附属物
 *
 *  @param tableView <#tableView description#>
 *  @param indexPath <#indexPath description#>
 *
 *  @return <#return value description#>
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *tableViewCell = [[UITableViewCell alloc] init];
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            tableViewCell.textLabel.text = @"张三";
        }else if (indexPath.row == 1){
            tableViewCell.textLabel.text = @"李四";
        }else{
            tableViewCell.textLabel.text = @"王五";
        }
    }else{
        if (indexPath.row == 0) {
            tableViewCell.textLabel.text = @"Lily";
        }else if (indexPath.row == 1){
            tableViewCell.textLabel.text = @"Jack";
        }
    }
    
    
    return tableViewCell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return @"第一班";
    }else{
        return @"第二班";
    }
    
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return @"成绩优异班";
    }else{
        return @"优秀班";
    }
    
}


@end
