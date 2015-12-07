//
//  AppInfo.m
//  22_appManagment
//
//  Created by 杜东方 on 15/11/21.
//  Copyright © 2015年 private. All rights reserved.
//

#import "AppInfo.h"

@implementation AppInfo

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self =[super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    
    return self;
}

+(instancetype)appInfoWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

+(NSArray *)appInfoList{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"apps_full" ofType:@"plist"];
    NSMutableArray *result = [NSMutableArray array];
    
    for (NSDictionary *dic in [NSArray arrayWithContentsOfFile:path]) {
        [result addObject:[self appInfoWithDic:dic]];
    }
    
    return result;
}
@end
