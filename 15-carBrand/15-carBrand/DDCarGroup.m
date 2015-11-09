//
//  DDCarGroup.m
//  15-carBrand
//
//  Created by 杜东方 on 15/11/8.
//  Copyright © 2015年 private. All rights reserved.
//

#import "DDCarGroup.h"
#import "DDCar.h"

@implementation DDCarGroup


- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    
    return self;
}

+ (instancetype)carGroup:(NSDictionary *)dic{
    return [[DDCarGroup alloc] initWithDic:dic];
}


+ (NSArray *)carGroups{
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:@"cars_total" ofType:@"plist"];
    
    NSMutableArray *tempArray = [NSMutableArray array];
    
    for (NSDictionary *dic in [NSArray arrayWithContentsOfFile:path]) {
        DDCarGroup *carGroup = [DDCarGroup carGroup:dic];
        [tempArray addObject:carGroup];
        
        NSMutableArray *cars = [NSMutableArray array];
        
        for (NSDictionary *carDic in carGroup.cars) {
            //NSLog(@"%@",carDic);
            DDCar *car = [DDCar car:carDic];
            [cars addObject:car];
        }
        
        carGroup.cars = cars;
       
        
    }
    
    return tempArray;
    
}


- (NSString *)description{
    return [NSString stringWithFormat:@"%@:%@",self.title,self.cars];
}

@end
