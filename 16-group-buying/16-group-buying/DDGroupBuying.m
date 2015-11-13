//
//  DDGroupBuying.m
//  16-group-buying
//
//  Created by 杜东方 on 15/11/9.
//  Copyright © 2015年 private. All rights reserved.
//

#import "DDGroupBuying.h"

@implementation DDGroupBuying

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    
    return self;
}

+ (instancetype)groupBuying:(NSDictionary *)dic{
    return [[DDGroupBuying alloc] initWithDic:dic];
}

+ (NSMutableArray *)groupBuyingList{
    NSMutableArray *result = [NSMutableArray array];
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:@"tgs" ofType:@"plist"];
    
    for (NSDictionary *dic in [NSArray arrayWithContentsOfFile:path]) {
        [result addObject:[self groupBuying:dic]];
    }
    
    return result;
}
@end
