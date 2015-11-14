//
//  DDMicroBlogFrame.h
//  17_weibo
//
//  Created by 杜东方 on 15/11/14.
//  Copyright © 2015年 private. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDMicroBlog.h"

//定义宏
#define NAME_FONT_SIZE 15
#define TEXT_FONT_SIZE 14

@interface DDMicroBlogFrame : NSObject

@property(nonatomic,strong)DDMicroBlog *microBlog;

@property(nonatomic,assign,readonly)CGRect iconImageViewFrame;
@property(nonatomic,assign,readonly)CGRect nameLabelViewFrame;
@property(nonatomic,assign,readonly)CGRect vipImageViewFrame;
@property(nonatomic,assign,readonly)CGRect contentLabelViewFrame;
@property(nonatomic,assign,readonly)CGRect pictureImageViewFrame;

@property(nonatomic,assign,readonly)CGFloat rowHeight;

@end
