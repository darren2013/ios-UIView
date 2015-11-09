//
//  ViewController.m
//  01-plus-calculator
//
//  Created by 杜东方 on 15/10/25.
//  Copyright © 2015年 private. All rights reserved.
//

#import "ViewController.h"



@interface ViewController ()

//所有UIView控件都使用weak类型；IBOutlet代表这个属性可以和某个控件连接
@property (nonatomic,weak)IBOutlet UITextField *num1TextField;

@property (nonatomic,weak)IBOutlet UITextField *num2TextField;

@property (nonatomic,weak)IBOutlet UILabel *result;



//IBAction只是一个声明相当于void,只有返回类型是IBAction类型才有资格与storyboard连接
//与UI交互方法，一般都写在类扩展里，私有方法
- (IBAction)calculate;

@end

@implementation ViewController

- (void)calculate
{
    NSString *num1 = self.num1TextField.text;
    NSString *num2 = self.num2TextField.text;
    
    int finalRes = num1.intValue + num2.intValue;
    
    self.result.text = [NSString stringWithFormat:@"%d",finalRes];
    
    //将键盘自动退回
   // [self.num1TextField resignFirstResponder];
    //[self.num2TextField resignFirstResponder];
    [self.view endEditing:YES];
    NSLog(@"button is clicked!");
}
@end
