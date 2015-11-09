//
//  DDCar.h
//  15-carBrand
//
//  Created by 杜东方 on 15/11/8.
//  Copyright © 2015年 private. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDCar : NSObject

@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *icon;


-(instancetype)initCarWithDic:(NSDictionary *)dic;

+(instancetype)car:(NSDictionary *)dic;

@end
