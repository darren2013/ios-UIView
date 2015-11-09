//
//  ViewController.m
//  14-LOL
//
//  Created by 杜东方 on 15/11/8.
//  Copyright © 2015年 private. All rights reserved.
//

/**
 *  UITableView UITableViewStyle，只能在storyBoard中设置，不能在代码中改变，因为是只读的
 *
 *  @param <UITableViewDataSource <#<UITableViewDataSource description#>
 *  @param nonatomic              <#nonatomic description#>
 *  @param strong                 <#strong description#>
 *
 *  @return <#return value description#>
 */

#import "ViewController.h"
#import "DDHero.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)NSArray *heros;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
   // NSLog(@"%ld",self.heros.count);
    
    //1.UITableView dataSource可以通过连线方式实现
    
    //设置tableView行高
    //self.tableView.rowHeight = 200;
    
    //设置top和bottom是没有用的
    //self.tableView.separatorInset = UIEdgeInsetsMake(100, 0, 100, 0);
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 10, 0, 10);
    self.tableView.separatorColor = [UIColor redColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    self.tableView.tableHeaderView = [UIButton buttonWithType:UIButtonTypeContactAdd];
    
    //设置背景色
    //self.tableView.backgroundColor = [UIColor redColor];
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor redColor];
    
    //虽然没有设置view frame,缺省是和tableView一样的
    self.tableView.backgroundView = view;
    
}


- (BOOL)prefersStatusBarHidden{
    return YES;
}

-(NSArray *)heros{
    if (_heros == nil) {
        _heros = [DDHero heroList];
    }
    
    return _heros;
}


#pragma mark - UITableViewDataSource的方法

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.heros.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //缺省模式下，不显示detailTextLabel
    //UITableViewCell *viewCell = [[UITableViewCell alloc] init];
    
    //UITableViewCellStyleSubtitle
    //1.不适用缓存，导致每次都会重新创建cell
//    UITableViewCell *viewCell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    
    /**
     *  使用缓存：
     每次将销毁的cell(当cell不在屏幕显示时，销毁)放入队列中，创建cell之前先从队列中去取，取不到，然后再创建
     */
    
    static NSString *reuseId = @"hero";
    
    UITableViewCell *viewCell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    
    NSLog(@"%p",&viewCell);
    
    if (viewCell == nil) {
        
        
        viewCell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier:reuseId];
    }
    
    
    
    
    
    
    
    DDHero *hero = self.heros[indexPath.row];
    
    viewCell.textLabel.text = hero.name;
    viewCell.imageView.image = [UIImage imageNamed:hero.icon];
    viewCell.detailTextLabel.text = hero.intro;
    
    //设置附属物
    //viewCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    //附属物可以自定义view
    viewCell.accessoryView = [UIButton buttonWithType:UIButtonTypeContactAdd];
    
    //完全显示detailTextLabel内容
    //viewCell.detailTextLabel.numberOfLines = 0;
    
    //设置颜色为透明
    //viewCell.backgroundColor = [UIColor clearColor];
    return viewCell;
}

#pragma mark - delegate方法

//设置cell行高
//- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.row % 2 == 0) {
//        return 60;
//    }else{
//        return 100;
//    }
//}

@end
