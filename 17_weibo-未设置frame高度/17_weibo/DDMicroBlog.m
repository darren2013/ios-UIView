//
//  DDMicroBlog.m
//  17_weibo
//
//  Created by 杜东方 on 15/11/13.
//  Copyright © 2015年 private. All rights reserved.
//

#import "DDMicroBlog.h"

@implementation DDMicroBlog

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    
    return self;
}


+(instancetype)micronBlogWithDic:(NSDictionary *)dic{
    return [[DDMicroBlog alloc] initWithDic:dic];
}

+(NSArray *)microBlogList{
    NSMutableArray *mutableArray = [NSMutableArray array];
    NSString *file = [[NSBundle mainBundle] pathForResource:@"microblog" ofType:@"plist"];
    
    for (NSDictionary *dic in [NSArray arrayWithContentsOfFile:file]) {
        [mutableArray addObject:[self micronBlogWithDic:dic]];
    }
    
    return mutableArray;
}


@end
