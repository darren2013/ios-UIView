//
//  DDAppInfo.m
//  09-application-management
//
//  Created by 杜东方 on 15/10/31.
//  Copyright © 2015年 private. All rights reserved.
//

#import "DDAppInfo.h"

@implementation DDAppInfo


- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        self.name = dic[@"name"];
        self.icon = dic[@"icon"];
    }
    
    return self;
}

+ (instancetype)appInfo:(NSDictionary *)dic
{
    return [[self alloc] initWithDic:dic];
}

+(NSArray *)appInfoList
{
    NSBundle *bundle = [NSBundle mainBundle];
    
    NSString *filePath = [bundle pathForResource:@"app" ofType:@"plist"];
    
    NSMutableArray *tempAppInfos = [NSMutableArray array];
    
    for (NSDictionary *dic in  [NSArray arrayWithContentsOfFile:filePath]) {
        //            DDAppInfo *appInfo = [[DDAppInfo alloc] init];
        //            appInfo.name = dic[@"name"];
        //            appInfo.icon = dic[@"icon"];
        
        DDAppInfo *appInfo = [DDAppInfo appInfo:dic];
        [tempAppInfos addObject:appInfo];
    }
    
    return tempAppInfos;
}


@end
