//
//  DDQQMessage.m
//  18_qq
//
//  Created by 杜东方 on 15/11/15.
//  Copyright © 2015年 private. All rights reserved.
//

#import "DDMessage.h"

@implementation DDMessage

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    
    return self;
}

+ (instancetype)messageWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

+(NSArray *)messageList{
    NSMutableArray *result = [NSMutableArray array];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"messages" ofType:@"plist"];
    DDMessage *preMessage;
    
    for (NSDictionary *dic in [NSArray arrayWithContentsOfFile:path]) {
        DDMessage *message = [self messageWithDic:dic];
        preMessage = [result lastObject];
        
        if ([message.time isEqualToString:preMessage.time]) {
            message.timeHidden = YES;
        }
        
        [result addObject:message];
    }
    return result;
}
@end
