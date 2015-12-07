//
//  DDFriend.m
//  21_qq_frinends
//
//  Created by 杜东方 on 15/11/17.
//  Copyright © 2015年 private. All rights reserved.
//

#import "DDFriend.h"

@implementation DDFriend


- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    
    return self;
}

+(instancetype)friendWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}
@end
