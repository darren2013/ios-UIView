//
//  DDMicroBlog.h
//  17_weibo
//
//  Created by 杜东方 on 15/11/13.
//  Copyright © 2015年 private. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DDMicroBlog : NSObject

@property(nonatomic,copy)NSString* text;
@property(nonatomic,copy)NSString* icon;
@property(nonatomic,copy)NSString* name;
@property(nonatomic,assign,getter=isVip)BOOL vip;
@property(nonatomic,copy)NSString* picture;


-(instancetype)initWithDic:(NSDictionary*)dic;

+(instancetype)micronBlogWithDic:(NSDictionary*)dic;

+(NSArray *)microBlogList;

@end
