//
//  DDTableViewController.m
//  17_weibo
//
//  Created by 杜东方 on 15/11/14.
//  Copyright © 2015年 private. All rights reserved.
//

#import "DDTableViewController.h"
#import "DDMicroBlog.h"
#import "DDMicroBlogCell.h"
#import "DDMicroBlogFrame.h"

@interface DDTableViewController ()

@property(nonatomic,strong)NSArray *microBlogFrames;

@end

@implementation DDTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //self.tableView.rowHeight = 200;
    
    self.tableView.allowsSelection = NO;
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
}

-(BOOL)prefersStatusBarHidden{
    return YES;
}

- (NSArray *)microBlogFrames{
    if (!_microBlogFrames) {
        NSMutableArray *microBlogFrames = [NSMutableArray array];
        
        NSArray *microBlogs = [DDMicroBlog microBlogList];
        
        for (DDMicroBlog *microBlog in microBlogs) {
            DDMicroBlogFrame *microBlogFrame = [[DDMicroBlogFrame alloc] init];
            [microBlogFrames addObject:microBlogFrame];
            microBlogFrame.microBlog = microBlog;
        }
        
        _microBlogFrames = microBlogFrames;
    }
    
    return _microBlogFrames;
}


//- (NSArray *)microBlogs{
//    if (!_microBlogs) {
//        _microBlogs = [DDMicroBlog microBlogList];
//    }
//    
//    return _microBlogs;
//}


#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.microBlogFrames.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //1.创建自定义tableViewCell
    DDMicroBlogCell *cell = [DDMicroBlogCell micronBlogCellWithTableView:tableView];
    
    //2.给自定义tableViewCell赋值
    cell.microBlogFrame = self.microBlogFrames[indexPath.row];
    return cell;
}

#pragma mark - Table View Delegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    DDMicroBlogFrame *micronBlogFrame = self.microBlogFrames[indexPath.row];
    return micronBlogFrame.rowHeight;
}



@end
