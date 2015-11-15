//
//  DDMessageFrame.h
//  18_qq
//
//  Created by 杜东方 on 15/11/15.
//  Copyright © 2015年 private. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "DDMessage.h"

#define TEXT_FONT_SIZE 15
#define TEXT_PADDING 20

@interface DDMessageFrame : NSObject

@property(nonatomic,assign,readonly)CGRect timeFrame;
@property(nonatomic,assign,readonly)CGRect headFrame;
@property(nonatomic,assign,readonly)CGRect contentFrame;

@property(nonatomic,assign,readonly)CGFloat rowHeight;

@property(nonatomic,strong)DDMessage *message;

+(NSMutableArray*)messageFrameList;


@end
