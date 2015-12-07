//
//  ViewController.m
//  21_qq_frinends
//
//  Created by 杜东方 on 15/11/17.
//  Copyright © 2015年 private. All rights reserved.
//

#import "ViewController.h"
#import "DDFriendGroup.h"
#import "DDFriend.h"
#import "DDFriendGroupHeaderView.h"

@interface ViewController ()<DDFriendGroupHeaderViewDelegate>

@property(nonatomic,strong)NSArray *friendGroups;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


-(NSArray *)friendGroups{
    if (!_friendGroups) {
        _friendGroups = [DDFriendGroup friendGroupList];
    }
    
    return _friendGroups;
}


-(BOOL)prefersStatusBarHidden{
    return YES;
}

#pragma mark - TableViewDataSource 方法实现
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.friendGroups.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    DDFriendGroup *friendGroup = self.friendGroups[section];
    return friendGroup.isExpand ? friendGroup.friends.count : 0;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *reuseId = @"qqFriends";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseId];
    }
    
    DDFriendGroup *friendGroup = self.friendGroups[indexPath.section];
    DDFriend *friend = friendGroup.friends[indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:friend.icon];
    cell.textLabel.text = friend.name;
    cell.detailTextLabel.text = friend.intro;
    
    if (friend.isVip) cell.textLabel.textColor = [UIColor redColor];
    else cell.textLabel.textColor = [UIColor blackColor];
        
    return cell;
}

//-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    DDFriendGroup *friendGroup = self.friendGroups[section];
//    return friendGroup.name;
//}

#pragma mark - 代理方法实现

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    DDFriendGroupHeaderView *headerView = [DDFriendGroupHeaderView friendGroupHeaderViewWithTableView:tableView];
    
    headerView.friendGroup = self.friendGroups[section];
    headerView.delegate = self;
    headerView.tag = section;
    
    return headerView;
}

//也可以设置tableView属性
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44;
}

#pragma mark -headerview delegate方法实现

-(void)headerViewDidClickedNameView:(DDFriendGroupHeaderView *)headerView{
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:headerView.tag];
    
    [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
    
}


@end
