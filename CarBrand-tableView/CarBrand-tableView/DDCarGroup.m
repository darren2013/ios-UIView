//
//  DDCarGroup.m
//  CarBrand-tableView
//
//  Created by 杜东方 on 15/11/8.
//  Copyright © 2015年 private. All rights reserved.
//

#import "DDCarGroup.h"

@implementation DDCarGroup

- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    
    return self;
}

+ (instancetype)carGroupWithDic:(NSDictionary *)dic
{
    return [[DDCarGroup alloc] initWithDic:dic];
}

+ (NSArray *)carGroupList{
    NSMutableArray *tempArray = [NSMutableArray array];
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *filePath = [bundle pathForResource:@"cars_simple" ofType:@"plist"];
    
    for (NSDictionary *dic in [NSArray arrayWithContentsOfFile:filePath]) {
        DDCarGroup *carGroup = [[DDCarGroup alloc] initWithDic:dic];
        [tempArray addObject:carGroup];
    }
    
    return tempArray;
}
@end
