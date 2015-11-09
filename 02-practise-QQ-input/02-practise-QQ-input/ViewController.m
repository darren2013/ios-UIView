//
//  ViewController.m
//  02-practise-QQ-input
//
//  Created by 杜东方 on 15/10/25.
//  Copyright © 2015年 private. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,weak) IBOutlet UITextField *qqTextField;

@property (nonatomic,weak) IBOutlet UITextField *passwordTextField;

- (IBAction)login;

- (IBAction)reset;

@end

@implementation ViewController

-(void)login
{
    NSString *qqStr = self.qqTextField.text;
    NSString *password = self.passwordTextField.text;
    
    NSLog(@"qq=%@,passowrd=%@",qqStr,password);
    
    [self.view endEditing:YES];
}

- (void)reset
{
    self.qqTextField.text = @"";
    self.passwordTextField.text = @"";
}

@end
