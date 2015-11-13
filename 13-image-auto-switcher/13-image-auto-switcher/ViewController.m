//
//  ViewController.m
//  13-image-auto-switcher
//
//  Created by 杜东方 on 15/11/7.
//  Copyright © 2015年 private. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControlView;

@property(nonatomic,strong)NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    int count = 5;
    CGSize scrollViewSize = self.scrollView.frame.size;
    
    for (int i =0; i < count; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        [self.scrollView addSubview:imageView];
        
        NSString *imageName = [NSString stringWithFormat:@"img_%02d",i+1];
       
        [imageView setImage:[UIImage imageNamed:imageName]];
        
        //image frame
        imageView.frame = CGRectMake(i*scrollViewSize.width, 0, scrollViewSize.width, scrollViewSize.height);
        
    }
    
    self.scrollView.contentSize = CGSizeMake(count * scrollViewSize.width, 0);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.pagingEnabled = YES;
    
    self.pageControlView.numberOfPages = count;
    
    self.scrollView.delegate = self;
    
    
    [self addCustomTimer];
}


- (void) addCustomTimer{
    NSTimer *timer = [NSTimer timerWithTimeInterval:2 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    self.timer = timer;
    
    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    
    //NSDefaultRunLoopMode,其他带有滚动的scrollRoll滚动时，会受影响
    //[runLoop addTimer:timer forMode:NSDefaultRunLoopMode];
    [runLoop addTimer:timer forMode:NSRunLoopCommonModes];
    //缺省是等timerInterval后，才出发，手动调用fire后，可以立即触发
    //[timer fire];
}


- (void)nextPage{
    //NSLog(@"next page is called.");
    
    NSInteger currentPage = self.pageControlView.currentPage;
    
    //pageno是从0开始
    if (currentPage == self.pageControlView.numberOfPages - 1) {
        currentPage = 0;
    }else{
        currentPage++;
    }
    
    [UIView animateWithDuration:1 animations:^{
        self.scrollView.contentOffset = CGPointMake(currentPage*self.scrollView.frame.size.width, 0);
    }];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //NSLog(@"%f",scrollView.contentOffset.x);
    CGFloat width = self.scrollView.frame.size.width;
    
    int currentPage = (scrollView.contentOffset.x + width / 2) / width;
    //CGFloat remainder = scrollView.contentOffset.x % self.scrollView.frame.size.width;
    
    self.pageControlView.currentPage = currentPage;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.timer invalidate];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    //timer另外一种调度方式
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    
    [self addCustomTimer];
}


@end
