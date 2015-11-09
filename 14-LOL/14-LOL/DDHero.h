//
//  DDHero.h
//  14-LOL
//
//  Created by 杜东方 on 15/11/8.
//  Copyright © 2015年 private. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDHero : NSObject

@property(nonatomic,copy)NSString *icon;
@property(nonatomic,copy)NSString *intro;
@property(nonatomic,copy)NSString *name;

- (instancetype) initWithDic:(NSDictionary *)dic;

+ (instancetype) hero:(NSDictionary *)dic;

+ (NSArray *) heroList;
@end
