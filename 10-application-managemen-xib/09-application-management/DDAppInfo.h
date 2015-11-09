//
//  DDAppInfo.h
//  09-application-management
//
//  Created by 杜东方 on 15/10/31.
//  Copyright © 2015年 private. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDAppInfo : NSObject

@property (nonatomic,copy)NSString *name;

@property (nonatomic,copy)NSString *icon;

+(instancetype) appInfo:(NSDictionary*)dic;

+ (NSArray*) appInfoList;

- (instancetype) initWithDic:(NSDictionary*)dic;



@end
