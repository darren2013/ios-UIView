//
//  DDQQMessage.h
//  18_qq
//
//  Created by 杜东方 on 15/11/15.
//  Copyright © 2015年 private. All rights reserved.
//

#import <Foundation/Foundation.h>

//enum MessageType{
//    MessageTypeSelf = 0,
//    MessageTypeOther = 1
//};
//
//typedef enum MessageType MessageType;

//上面几行代码等价于下面：
//typedef enum{
//    MessageTypeSelf = 0,
//    MessageTypeOther = 1
//}MessageType;

//上面代码可以省略写成下面
typedef enum{
    MessageTypeSelf,
    MessageTypeOther
}MessageType;

@interface DDMessage : NSObject

@property(nonatomic,copy)NSString *text;
@property(nonatomic,copy)NSString *time;
@property(nonatomic,assign)MessageType type;

@property(nonatomic,assign,getter=isTimeHidden)BOOL timeHidden;


-(instancetype)initWithDic:(NSDictionary*)dic;

+(instancetype)messageWithDic:(NSDictionary*)dic;

+(NSArray*)messageList;

@end
