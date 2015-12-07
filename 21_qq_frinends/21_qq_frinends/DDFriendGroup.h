//
//  DDFriendGroup.h
//  21_qq_frinends
//
//  Created by 杜东方 on 15/11/17.
//  Copyright © 2015年 private. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDFriendGroup : NSObject

@property(nonatomic,copy)NSString *name;
@property(nonatomic,assign)NSInteger online;
@property(nonatomic,strong)NSArray *friends;
@property(nonatomic,assign,getter=isExpand)BOOL expand;

-(instancetype)initWithDic:(NSDictionary*)dic;

+(instancetype)friendGroupWithDic:(NSDictionary*)dic;

+(NSArray*)friendGroupList;

@end
