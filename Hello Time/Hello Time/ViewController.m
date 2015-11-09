//
//  ViewController.m
//  Hello Time
//
//  Created by 杜东方 on 15/11/4.
//  Copyright © 2015年 private. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self checkTime:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) checkTime:(id)sender{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"h:mm:ss a"];
    NSString *date = [dateFormatter stringFromDate:[NSDate date]];
    
    self.timeLabel.text = date;
    
    [self performSelector:@selector(checkTime:) withObject:self afterDelay:1];
}

@end
