//
//  ViewController.m
//  16-group-buying
//
//  Created by 杜东方 on 15/11/9.
//  Copyright © 2015年 private. All rights reserved.
//

#import "ViewController.h"
#import "DDGroupBuying.h"

@interface ViewController ()<UITableViewDataSource>

@property(nonatomic,strong)NSArray *groupBuyings;

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
    static NSString *reuseId = @"group-buying";
    
    UITableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    
    if (tableViewCell == nil) {
//        tableViewCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseId];
        
        
        /**
         *  从xib中加载view,为了使用缓存，记得一定要把xib文件中得TableViewCell控件的identifier设置为:group-buying
         */
        tableViewCell = [[[NSBundle mainBundle] loadNibNamed:@"DDGroupBuying" owner:nil options:nil] lastObject];
        
        //加载xib另外一种方式
//        UINib *nib = [UINib nibWithNibName:@"DDGroupBuying" bundle:nil];
//        tableViewCell = [[nib instantiateWithOwner:nil options:nil] lastObject];
        
        
    }
    
    DDGroupBuying *groupBuying = self.groupBuyings[indexPath.row];
    
//    tableViewCell.textLabel.text = groupBuying.title;
//    tableViewCell.imageView.image = [UIImage imageNamed:groupBuying.icon];
//    tableViewCell.detailTextLabel.text = groupBuying.price;
    
    //可以设置tag方式，给自定义的view赋值，比较麻烦；另外导致controller需要了解xib细节，耦合太厉害
    UILabel *titleLabel = [tableViewCell viewWithTag:11];
    titleLabel.text = groupBuying.title;
    
    return tableViewCell;
}

@end
