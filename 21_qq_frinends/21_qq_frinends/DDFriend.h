//
//  DDFriend.h
//  21_qq_frinends
//
//  Created by 杜东方 on 15/11/17.
//  Copyright © 2015年 private. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDFriend : NSObject

@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *icon;
@property(nonatomic,copy)NSString *intro;
@property(nonatomic,assign,getter=isVip)BOOL vip;

-(instancetype)initWithDic:(NSDictionary *)dic;

+(instancetype)friendWithDic:(NSDictionary*)dic;

@end
