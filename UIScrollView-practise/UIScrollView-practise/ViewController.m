//
//  ViewController.m
//  UIScrollView-practise
//
//  Created by 杜东方 on 15/11/7.
//  Copyright © 2015年 private. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)rollBtnView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //设置滚动范围
    self.scrollView.contentSize = CGSizeMake(4288, 2848);
    
    //设置间距
    //self.scrollView.contentInset = UIEdgeInsetsMake(50, 50, 50, 50);
    
    //只能设置图片起始位置偏移，拖拽后，会又回到原点>0时，在屏幕外，<0在屏幕内
    //self.scrollView.contentOffset = CGPointMake(-100, -100);
    
    //设置间距
    self.scrollView.contentInset = UIEdgeInsetsMake(50, 50, 50, 50);
    
    //只能设置图片起始位置偏移，拖拽后，会又回到原点>0时，在屏幕外，<0在屏幕内
    self.scrollView.contentOffset = CGPointMake(-50, -50);

    //隐藏滚动条
   // self.scrollView.showsHorizontalScrollIndicator = NO;
   // self.scrollView.showsVerticalScrollIndicator = NO;
    
    //反弹效果失效
    //self.scrollView.bounces = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)rollBtnView {
    CGPoint offset  = self.scrollView.contentOffset;
    offset.x += 100;
    offset.y += 100;
    
    [self.scrollView setContentOffset:offset animated:YES];
    
    
    //添加相对可控的动画
//    [UIView animateWithDuration:1.0 animations:^{
//        self.scrollView.contentOffset = offset;
//    }];
    
    
}
@end
