//
//  DDCarGroup.h
//  CarBrand-tableView
//
//  Created by 杜东方 on 15/11/8.
//  Copyright © 2015年 private. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDCarGroup : NSObject


@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *desc;
@property(nonatomic,strong)NSArray *cars;

- (instancetype) initWithDic:(NSDictionary *)dic;

+ (instancetype) carGroupWithDic:(NSDictionary *)dic;

+ (NSArray *)carGroupList;
@end
