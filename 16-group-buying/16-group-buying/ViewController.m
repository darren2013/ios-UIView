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
#import "DDHeaderView.h"

@interface ViewController ()<UITableViewDataSource,DDFooterViewDelegate>

@property(nonatomic,strong)NSMutableArray *groupBuyings;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (NSMutableArray *)groupBuyings{
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
    
    DDFooterView *footerView = [DDFooterView footerView];
    self.tableView.tableFooterView = footerView;
    
    self.tableView.tableHeaderView = [DDHeaderView headerView];
    
    footerView.delegate = self;
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
    NSLog(@"load tableView%@",indexPath);
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

//增量加载
- (void)footerViewDidClickedLoadMoreBtn:(DDFooterView *)footerView{
    //模拟从网络上获取数据
    DDGroupBuying *groupBuying = [[DDGroupBuying alloc] init];
    groupBuying.title = @"蟹堡王";
    groupBuying.icon = @"5ee372ff039073317a49af5442748071";
    groupBuying.price = @"34";
    groupBuying.buyCount = @"89";
 
    [self.groupBuyings addObject:groupBuying];
    
    //这种方法会把datasource数据重新加载一遍，不合适
    //[self.tableView reloadData];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:(self.groupBuyings.count - 1) inSection:0];
    
    //需要先把指定的indexPath那行删除掉，然后再添加，使用这种方法不合适，因为之前idnexPath指定的元素根本不存在
    //[self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
    //让加载的数据能够以一行完整显示
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

@end
