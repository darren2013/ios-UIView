//
//  ViewController.m
//  04_button_introduction_optimize
//
//  Created by 杜东方 on 15/10/27.
//  Copyright © 2015年 private. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,weak) IBOutlet UIButton *headBtn;

- (IBAction)move:(UIButton*)sender;

- (IBAction)changeSize:(UIButton*)sender;

@end

@implementation ViewController

- (void)move:(UIButton *)sender
{
    long tag = sender.tag;
    CGPoint center = self.headBtn.center;
    
    switch (tag) {
        case 0:
            center.y -= 50;
            break;
        case 1:
            center.y += 50;
            break;
        case 2:
            center.x -= 50;
            break;
        case 3:
            center.x += 50;
            break;
        default:
            break;
    }
    
    //加入动画
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.0];
    self.headBtn.center = center;
    [UIView commitAnimations];
    NSLog(@"tag=%zd",tag);
}

- (void)changeSize:(UIButton *)sender
{
    long tag = sender.tag;
    CGRect rect = self.headBtn.bounds;
    
    switch (tag) {
        case 11:
            rect.size.width += 10;
            rect.size.height += 10;
            break;
        case 12:
            rect.size.width -= 10;
            rect.size.height -= 10;
            break;
        default:
            break;
    }
    
    [UIView animateWithDuration:2 animations:^{
        self.headBtn.bounds = rect;
    }];
    
}
@end
