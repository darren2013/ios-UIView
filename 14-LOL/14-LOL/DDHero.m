//
//  DDHero.m
//  14-LOL
//
//  Created by 杜东方 on 15/11/8.
//  Copyright © 2015年 private. All rights reserved.
//

#import "DDHero.h"

@implementation DDHero

- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    
    return self;
}

+ (instancetype)hero:(NSDictionary *)dic
{
    return [[self alloc] initWithDic:dic];
}

+ (NSArray *)heroList{
    NSMutableArray *tmpArray = [NSMutableArray array];
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:@"heros" ofType:@"plist"];
    
    for (NSDictionary *dic in [NSArray arrayWithContentsOfFile:path]) {
        [tmpArray addObject:[self hero:dic]];
    }
    
    return tmpArray;
}

@end
