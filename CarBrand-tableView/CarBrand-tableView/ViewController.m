//
//  ViewController.m
//  CarBrand-tableView
//
//  Created by 杜东方 on 15/11/8.
//  Copyright © 2015年 private. All rights reserved.
//

/**
 *  tableView属性有plain和groupd属性
 
 *
 *  @param weak      <#weak description#>
 *  @param nonatomic <#nonatomic description#>
 *
 *  @return <#return value description#>
 */

#import "ViewController.h"
#import "DDCarGroup.h"

@interface ViewController ()<UITableViewDataSource>


@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic,strong)NSArray *carGroups;

@end

@implementation ViewController


- (BOOL)prefersStatusBarHidden{
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   // NSLog(@"%@",[DDCarGroup carGroupList]);
    
    //1.设置tableView的dataSource
   self.tableView.dataSource = self;
    
}

//懒加载数据
- (NSArray *)carGroups{
    if (_carGroups == nil) {
        _carGroups = [DDCarGroup carGroupList];
    }
    return _carGroups;
}



#pragma mark - tableView datasource方法实现

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.carGroups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    DDCarGroup *carGroup = self.carGroups[section];
    return carGroup.cars.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *tableViewCell = [[UITableViewCell alloc] init];
    DDCarGroup *carGroup = self.carGroups[indexPath.section];
    tableViewCell.textLabel.text = carGroup.cars[indexPath.row];
    return tableViewCell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    DDCarGroup *carGroup = self.carGroups[section];
    return carGroup.title;
}

-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    DDCarGroup *carGroup = self.carGroups[section];
    return carGroup.desc;
}


@end
