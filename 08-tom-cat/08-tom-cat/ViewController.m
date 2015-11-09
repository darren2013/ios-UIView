//
//  ViewController.m
//  08-tom-cat
//
//  Created by 杜东方 on 15/10/31.
//  Copyright © 2015年 private. All rights reserved.
//

/**
 1.Assets.xcasses文件夹下得图片，打包时，苹果会对其进行压缩加密，这样做的缺点，这些图片只能通过imageName获得
 
 
 2.解决Could not load the image referenced from a nib in the bundle with identifier
 
 往supporting Files拷贝文件时
 Select "Create Groups" NOT folders
 */

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)drink;
- (IBAction)footLeft;

/**
 *  
 */
- (IBAction)knockout;
@end

@implementation ViewController


- (void)runAnimationWithCount:(NSInteger) total andImageNamePrefix:(NSString*)imagePrefix{
    
    //同时只能有一个动画在播放
    if (self.imageView.isAnimating) return;
    
    NSMutableArray *images = [NSMutableArray array];
    
    for (int i=0; i<total; i++) {
        NSString *name = [NSString stringWithFormat:@"%@_%02d",imagePrefix,i];
        
        //通过imageNamed加载的图片会放在缓存在，对于使用大量的图片应用，会有内存问题
        //UIImage *image = [UIImage imageNamed:name];
       // NSString *bundlePath = [[NSBundle mainBundle] bundlePath];
       // NSLog(@"imagePath=%@",bundlePath);
        
        //由于Assets.xcassets目录中图片打包以后，会进行压缩加密，通过bundle方式是读取不到的
        //NSString *imagePath = [[NSBundle mainBundle] pathForResource:name ofType:@"jpg"];
        
        NSString *imagePath = [[NSBundle mainBundle] pathForResource:name ofType:@"jpg"];

        //imageWithContentFile 不会加载到内存
        UIImage *image =[UIImage imageWithContentsOfFile:imagePath];
        [ images addObject:image];
    }
    
    self.imageView.animationImages = images;
    
    self.imageView.animationRepeatCount = 1;
    self.imageView.animationDuration = total * 0.05;
    //注意执行动画是异步的
    [self.imageView startAnimating];
    CGFloat releaseTime = self.imageView.animationDuration + 0.1;
    
    //1.第一种释放缓存方式
    //[self performSelector:@selector(releaseCache)withObject:nil afterDelay:releaseTime];
    
    [self.imageView performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:releaseTime];
    
}

- (void) releaseCache{
    self.imageView.animationImages = nil;
}

- (IBAction)drink {
    [self runAnimationWithCount:81 andImageNamePrefix:@"drink"];
}

- (IBAction)footLeft {
    [self runAnimationWithCount:30 andImageNamePrefix:@"footLeft"];
}

- (IBAction)knockout {
    [self runAnimationWithCount:81 andImageNamePrefix:@"knockout"];
}


@end
