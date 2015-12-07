//
//  DDFriendGroup.m
//  21_qq_frinends
//
//  Created by 杜东方 on 15/11/17.
//  Copyright © 2015年 private. All rights reserved.
//

#import "DDFriendGroup.h"
#import "DDFriend.h"

@implementation DDFriendGroup

- (instancetype)initWithDic:(NSDictionary *)dic{
    
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    
    return self;
}

+ (instancetype)friendGroupWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

+ (NSArray *)friendGroupList{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"friends" ofType:@"plist"];
    NSMutableArray *result = [NSMutableArray array];
    
    for (NSDictionary *dic in [NSArray arrayWithContentsOfFile:filePath]) {
        DDFriendGroup *friendGroup = [self friendGroupWithDic:dic];
        [result addObject:friendGroup];
        
        NSMutableArray *friends = [NSMutableArray array];
        
        for (NSDictionary *friendInfo in friendGroup.friends) {
            DDFriend *friend = [DDFriend friendWithDic:friendInfo];
            [friends addObject:friend];
        }
        
        friendGroup.friends = friends;
    }
    
    return result;
}
@end
