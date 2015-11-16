//
//  NSString+Extend.h
//  18_qq
//
//  Created by 杜东方 on 15/11/16.
//  Copyright © 2015年 private. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Extend)

//+(CGSize) sizeText:(NSString*)text maxSize:(CGSize)maxSize fontSize:(CGFloat)fontSize;

-(CGSize) sizeOfTextMaxSize:(CGSize)maxSize fontSize:(CGFloat)fontSize;

@end
