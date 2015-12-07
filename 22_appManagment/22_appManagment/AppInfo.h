//
//  AppInfo.h
//  22_appManagment
//
//  Created by 杜东方 on 15/11/21.
//  Copyright © 2015年 private. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppInfo : NSObject


@property(nonatomic,copy)NSString *size;
@property(nonatomic,copy)NSString *download;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *icon;

-(instancetype)initWithDic:(NSDictionary*)dic;

+(instancetype)appInfoWithDic:(NSDictionary*)dic;

+(NSArray*)appInfoList;
@end
