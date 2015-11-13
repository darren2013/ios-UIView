//
//  DDGroupBuying.h
//  16-group-buying
//
//  Created by 杜东方 on 15/11/9.
//  Copyright © 2015年 private. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDGroupBuying : NSObject

@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *price;
@property(nonatomic,copy)NSString *icon;
@property(nonatomic,copy)NSString *buyCount;


-(instancetype)initWithDic:(NSDictionary *)dic;

+(instancetype)groupBuying:(NSDictionary *)dic;

+(NSMutableArray *) groupBuyingList;

@end
