//
//  ViewController.m
//  06-transform
//
//  Created by 杜东方 on 15/10/29.
//  Copyright © 2015年 private. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *headBtn;


- (IBAction)move:(UIButton *)sender;

- (IBAction)bigOrSmall;
- (IBAction)rotate;

@end

@implementation ViewController

- (IBAction)move:(UIButton *)sender {
    
    
    /**
        frame和CGAffineTransformMakeTranslation不能一起使用，移动位置会很错乱
     
     float x = self.headBtn.frame.origin.x;
     x += 10;
     
     
     self.headBtn.transform = CGAffineTransformMakeTranslation(x, 30);
     
     ------------------------
     self.headBtn.transform = CGAffineTransformMakeTranslation(10, 30);
     属于平移，只移动一次有效果
     
     */
    
    /**
     
     static int x = 0;
     x += 10;
     self.headBtn.transform = CGAffineTransformMakeTranslation(x, 0);
     
     */
  
    //self.headBtn.transform = CGAffineTransformTranslate(self.headBtn.transform, 10, 5);
    
    //也可以使用负数，代表向左上
    self.headBtn.transform = CGAffineTransformTranslate(self.headBtn.transform, -10, -5);
    
}

- (IBAction)bigOrSmall {
    
    [UIView animateWithDuration:1 animations:^{
        //注意此处不能使用负数 >1代表放大，<1代表缩小
        self.headBtn.transform = CGAffineTransformScale(self.headBtn.transform, 0.5, 0.5);
    }];
    
}

- (IBAction)rotate {
    [UIView animateWithDuration:1 animations:^{
        //负数是逆时针旋转
        self.headBtn.transform = CGAffineTransformRotate(self.headBtn.transform, -M_PI_4);
    }];
}
@end
