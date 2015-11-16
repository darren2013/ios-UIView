//
//  UIImage+Extend.m
//  18_qq
//
//  Created by 杜东方 on 15/11/16.
//  Copyright © 2015年 private. All rights reserved.
//

#import "UIImage+Extend.h"

@implementation UIImage (Extend)

+(UIImage *)resizeImage:(NSString *)imageName{
    UIImage *image = [UIImage imageNamed:imageName];
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}
@end
