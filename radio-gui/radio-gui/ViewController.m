//
//  ViewController.m
//  radio-gui
//
//  Created by 杜东方 on 15/11/7.
//  Copyright © 2015年 private. All rights reserved.
//

/**
 *  屏幕顶部的导航栏的高度约定大小为:64
 状态栏大小为:20,真正导航栏为44
 所以电台底部view高度为44
 *
 *  @param weak      <#weak description#>
 *  @param nonatomic <#nonatomic description#>
 *
 *  @return <#return value description#>
 */


#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIButton *wannaBeBtnView;
@end

@implementation ViewController

-(BOOL)prefersStatusBarHidden{
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"lastView heigth:%f",self.wannaBeBtnView.frame.size.height);
    NSLog(@"lastView y:%f",self.wannaBeBtnView.frame.origin.y);
    CGFloat maxY = CGRectGetMaxY(self.wannaBeBtnView.frame);
    NSLog(@"%f",maxY);
    //横向不滚动，设置为0
    //滚动范围加10，让上拉后，和底部view保持10个像素的距离
    self.scrollView.contentSize = CGSizeMake(0, maxY + 10);
    
    self.scrollView.contentOffset = CGPointMake(0, -64);
    self.scrollView.contentInset = UIEdgeInsetsMake(64, 0, 44, 0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
