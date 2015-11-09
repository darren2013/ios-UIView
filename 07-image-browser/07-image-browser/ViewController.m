//
//  ViewController.m
//  07-image-browser
//
//  Created by 杜东方 on 15/10/30.
//  Copyright © 2015年 private. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *indexLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;

@property (nonatomic,assign) int index;

@property (weak, nonatomic) IBOutlet UIButton *preBtn;

@property (nonatomic,strong)NSArray *array;

@property (nonatomic,assign)long total;

- (IBAction)next;


- (IBAction)last;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.'
    self.total = self.array.count;
    
    [self switchImage];
    
}

//资源一般放在getter方法中，实现懒加载，不要放在viewDidLoad
- (NSArray *)array
{
    if (_array == nil) {
        NSLog(@"load only once........");
        
        //NSBundle应用所在文件夹
       // NSString *path = [[NSBundle mainBundle] bundlePath];
        NSString *imageDataPath = [[NSBundle mainBundle] pathForResource:@"imageData" ofType:@"plist"];
        
        NSLog(@"path=%@",imageDataPath);
        
        
        //ofFile后缀的，一般都为绝对路径
        _array = [NSArray arrayWithContentsOfFile:imageDataPath];
        
//        _array = @[@{@"icon":@"biaoqingdi",@"desc":@"在他面前，其他神马表情都弱爆了！"},
//                   @{@"icon":@"wangba",@"desc":@"哥们为什么选八号呢"},
//                   @{@"icon":@"bingli",@"desc":@"这也忒狠了"},
//                   @{@"icon":@"chiniupa",@"desc":@"这也忒狠了"},
//                   @{@"icon":@"danteng",@"desc":@"亲，你能改下你的网名么？哈哈"}];
    }
    
    return _array;
}


- (void) switchImage{
    self.indexLabel.text = [NSString stringWithFormat:@"%d/%zd",self.index + 1,self.total];
    
    NSString *icon = self.array[self.index][@"icon"];
    NSString *desc = self.array[self.index][@"desc"];
    
    self.imageView.image = [UIImage imageNamed:icon];
    self.descriptionLabel.text = desc;
    
//    switch (self.index) {
//        case 0:
//            self.imageView.image = [UIImage imageNamed:@"biaoqingdi"];
//            self.descriptionLabel.text = @"在他面前，其他神马表情都弱爆了！";
//            break;
//        case 1:
//            self.imageView.image = [UIImage imageNamed:@"wangba"];
//            self.descriptionLabel.text = @"哥们为什么选八号呢";
//            break;
//        case 2:
//            self.imageView.image = [UIImage imageNamed:@"bingli"];
//            self.descriptionLabel.text = @"这也忒狠了";
//            break;
//        case 3:
//            self.imageView.image = [UIImage imageNamed:@"chiniupa"];
//            self.descriptionLabel.text = @"这小姑娘吃个牛排比杀牛还费劲啊";
//            break;
//        case 4:
//            self.imageView.image = [UIImage imageNamed:@"danteng"];
//            self.descriptionLabel.text = @"亲，你能改下你的网名么？哈哈";
//            break;
//            
//        default:
//            break;
//    }
    
    self.preBtn.enabled = self.index != 0;
    self.nextBtn.enabled = self.index != (self.total-1);
}


- (IBAction)next {
    self.index++;
    [self switchImage];
    
//    if (self.index == 4) {
//        self.nextBtn.enabled = NO;
//    }
//    
//    if (!self.preBtn.enabled) {
//        self.preBtn.enabled = YES;
//    }
}

- (IBAction)last {
    self.index--;
    [self switchImage];
    
//    if (self.index == 0) {
//        self.preBtn.enabled = NO;
//    }
//    
//    if (!self.nextBtn.enabled) {
//        self.nextBtn.enabled = YES;
//    }
}
@end
