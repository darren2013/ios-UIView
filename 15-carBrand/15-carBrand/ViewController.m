//
//  ViewController.m
//  15-carBrand
//
//  Created by 杜东方 on 15/11/8.
//  Copyright © 2015年 private. All rights reserved.
//

/**
 *  在tableView手动设置datasource,直接连接到ViewController
 *
 *  @param nonatomic <#nonatomic description#>
 *  @param strong    <#strong description#>
 *
 *  @return <#return value description#>
 */

#import "ViewController.h"
#import "DDCarGroup.h"
#import "DDCar.h"

@interface ViewController ()<UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic,strong)NSArray *carGroups;

@end

@implementation ViewController


-(NSArray *)carGroups{
    if (_carGroups == nil) {
        _carGroups = [DDCarGroup carGroups];
    }
    
    return _carGroups;
}


-(BOOL)prefersStatusBarHidden{
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   // NSLog(@"%@",self.carGroups);
}



#pragma mark - 实现DataSource方法


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.carGroups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    DDCarGroup *carGroup = self.carGroups[section];
    return carGroup.cars.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *reuseId = @"car";
    UITableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    
    if (tableViewCell == nil) {
        tableViewCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseId];
    }
    DDCarGroup *carGroup = self.carGroups[indexPath.section];
    DDCar *car = carGroup.cars[indexPath.row];
    
    tableViewCell.textLabel.text = car.name;
    tableViewCell.imageView.image = [UIImage imageNamed:car.icon];
    
    return tableViewCell;
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    DDCarGroup *carGroup = self.carGroups[section];
    return carGroup.title;
}

- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return [self.carGroups valueForKey:@"title"];
}

@end
