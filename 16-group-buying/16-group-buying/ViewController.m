//
//  ViewController.m
//  16-group-buying
//
//  Created by 杜东方 on 15/11/9.
//  Copyright © 2015年 private. All rights reserved.
//

/**
 *  一般footerView和headView高度约定为44;
 设定xib custom class之后才可以连线
 *
 *  @param nonatomic <#nonatomic description#>
 *  @param strong    <#strong description#>
 *
 *  @return <#return value description#>
 */

#import "ViewController.h"
#import "DDGroupBuying.h"
#import "DDGroupBuyingCell.h"
#import "DDFooterView.h"

@interface ViewController ()<UITableViewDataSource>

@property(nonatomic,strong)NSArray *groupBuyings;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (NSArray *)groupBuyings{
    if (_groupBuyings == nil) {
        _groupBuyings = [DDGroupBuying groupBuyingList];
    }
    
    return _groupBuyings;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //NSLog(@"groupBuyings:%@",self.groupBuyings);
    NSLog(@"%@",[NSBundle mainBundle]);
    
    self.tableView.rowHeight = 80;
    
    self.tableView.tableFooterView = [DDFooterView footerView];
}

-(BOOL)prefersStatusBarHidden{
    return YES;
}

#pragma mark - UITableViewDataSource方法实现

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.groupBuyings.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DDGroupBuyingCell *groupBuyingCell = [DDGroupBuyingCell groupBuyingCellWithTableView:tableView];
    
    DDGroupBuying *groupBuying = self.groupBuyings[indexPath.row];
    
    groupBuyingCell.groupBuying = groupBuying;
    
//    tableViewCell.textLabel.text = groupBuying.title;
//    tableViewCell.imageView.image = [UIImage imageNamed:groupBuying.icon];
//    tableViewCell.detailTextLabel.text = groupBuying.price;
    
    //可以设置tag方式，给自定义的view赋值，比较麻烦；另外导致controller需要了解xib细节，耦合太厉害
//    UILabel *titleLabel = [tableViewCell viewWithTag:11];
//    titleLabel.text = groupBuying.title;
    
    return groupBuyingCell;
}

@end
