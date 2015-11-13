//
//  DDHeaderView.m
//  16-group-buying
//
//  Created by 杜东方 on 15/11/13.
//  Copyright © 2015年 private. All rights reserved.
//

#import "DDHeaderView.h"

@interface DDHeaderView()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation DDHeaderView


+(instancetype)headerView{
    return [[[NSBundle mainBundle] loadNibNamed:@"DDHeaderView" owner:nil options:nil] lastObject];
}

//xib文件的控件加载完成后，执行
- (void)awakeFromNib{
    static int count = 5;
    CGFloat scrollViewW = self.scrollView.frame.size.width;
    CGFloat scrollViewH = self.scrollView.frame.size.height;
    
    
    for (int i=0; i<count; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        [self.scrollView addSubview:imageView];
        
        NSString *imageName = [NSString stringWithFormat:@"ad_%02d",i];
        imageView.image = [UIImage imageNamed:imageName];
        
        imageView.frame = CGRectMake(i*scrollViewW, 0, scrollViewW, scrollViewH);
    }
    
    self.scrollView.contentSize = CGSizeMake(scrollViewW*count, 0);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    
    self.scrollView.pagingEnabled = YES;
    //self.scrollView.
    
}
@end
