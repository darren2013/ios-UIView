//
//  DDCarGroup.h
//  15-carBrand
//
//  Created by 杜东方 on 15/11/8.
//  Copyright © 2015年 private. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDCarGroup : NSObject

@property(nonatomic,copy)NSString *title;

@property(nonatomic,strong)NSArray *cars;


-(instancetype) initWithDic:(NSDictionary *)dic;

+(instancetype) carGroup:(NSDictionary *)dic;

+(NSArray *) carGroups;

@end
