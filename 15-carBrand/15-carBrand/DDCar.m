//
//  DDCar.m
//  15-carBrand
//
//  Created by 杜东方 on 15/11/8.
//  Copyright © 2015年 private. All rights reserved.
//

#import "DDCar.h"

@implementation DDCar

- (instancetype)initCarWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    
    return self;
}

+ (instancetype)car:(NSDictionary *)dic{
    return [[DDCar alloc] initCarWithDic:dic];
}

- (NSString *)description{
    return [NSString stringWithFormat:@"%@-%@",self.name,self.icon];
}

@end
