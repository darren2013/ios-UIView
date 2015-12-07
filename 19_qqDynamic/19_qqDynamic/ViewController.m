//
//  ViewController.m
//  19_qqDynamic
//
//  Created by 杜东方 on 15/11/16.
//  Copyright © 2015年 private. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //self.tableView.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - TableView DataSource方法实现

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return section + 1;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* resuseId = @"qqDynamic";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:resuseId];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:resuseId];
    }
    
    if (indexPath.section == 0) {
        if(indexPath.row == 0){
            cell.imageView.image = [UIImage imageNamed:@"found_icons_qzone"];
            cell.textLabel.text = @"qq空间";
        }
    }else if(indexPath.section == 1){
        
    }else if(indexPath.section == 2){
        
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
    
}

//-(UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath{
//    return UITableViewCellAccessoryDisclosureIndicator;
//}

@end
