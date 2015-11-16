//
//  NSString+Extend.m
//  18_qq
//
//  Created by 杜东方 on 15/11/16.
//  Copyright © 2015年 private. All rights reserved.
//

#import "NSString+Extend.h"

@implementation NSString (Extend)

//+(CGSize)sizeText:(NSString *)text maxSize:(CGSize)maxSize fontSize:(CGFloat)fontSize{
//    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil].size;
//}

-(CGSize)sizeOfTextMaxSize:(CGSize)maxSize fontSize:(CGFloat)fontSize{
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil].size;
}
@end
