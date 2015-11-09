//
//  ViewController.m
//  03_button_basic
//
//  Created by 杜东方 on 15/10/26.
//  Copyright © 2015年 private. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(weak,nonatomic) IBOutlet UIButton *headBtn;

- (IBAction)up;

- (IBAction)left;

- (IBAction)down;

- (IBAction)right;

- (IBAction)big;

- (IBAction)minus;

@end

@implementation ViewController

- (IBAction)up
{
    
    CGRect frame = self.headBtn.frame;
    frame.origin.y -= 10;
    
    if (frame.origin.y <= 0) {
        frame.origin.y = 0;
    }
    self.headBtn.frame = frame;
    NSLog(@"up is clicked!");
}

- (IBAction)left
{
    CGRect frame = self.headBtn.frame;
    
    frame.origin.x -= 10;
    
    if (frame.origin.x <= 0) {
        frame.origin.x = 0;
    }
    
    self.headBtn.frame = frame;
}

- (IBAction)down
{
    CGRect frame = self.headBtn.frame;
    frame.origin.y += 10;
    self.headBtn.frame = frame;
}

- (IBAction)right
{
    CGRect frame = self.headBtn.frame;
    frame.origin.x += 10;
    self.headBtn.frame = frame;
}


//一定要注意storyboard中一定要disable use auto layout和use size classes
- (IBAction)big
{
    CGRect frame = self.headBtn.frame;
    
    frame.size.width += 10;
    frame.size.height += 10;
    NSLog(@"updated:%@",NSStringFromCGRect(frame));
    self.headBtn.frame = frame;
    NSLog(@"headBtn:%@",NSStringFromCGRect(self.headBtn.frame));
}

- (void)minus
{
    CGRect frame = self.headBtn.frame;
    frame.size.width -=10;
    frame.size.height -= 10;
    self.headBtn.frame = frame;
}
@end
