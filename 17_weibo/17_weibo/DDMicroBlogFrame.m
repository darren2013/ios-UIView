//
//  DDMicroBlogFrame.m
//  17_weibo
//
//  Created by 杜东方 on 15/11/14.
//  Copyright © 2015年 private. All rights reserved.
//

#import "DDMicroBlogFrame.h"


@implementation DDMicroBlogFrame


- (void)setMicroBlog:(DDMicroBlog *)microBlog{
    _microBlog = microBlog;
    CGFloat iconW = 30;
    CGFloat iconH = 30;
    CGFloat margin = 10;
    CGFloat iconX = margin;
    CGFloat iconY = margin;
    //头像位置
    _iconImageViewFrame = CGRectMake(iconX, iconY, iconW, iconH);
    
    //昵称
    CGSize maxSize = CGSizeMake(MAXFLOAT, MAXFLOAT);
    
    //计算文本大小
    //    CGSize nameSize = [self.microBlog.name boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:NAME_FONT_SIZE]} context:nil].size;
    
    CGSize nameSize = [self sizeText:self.microBlog.name maxSize:maxSize fontSize:NAME_FONT_SIZE];
    
    CGFloat nameX = CGRectGetMaxX(_iconImageViewFrame) + margin;
    CGFloat nameY = iconY + (iconH - nameSize.height)/2;
    _nameLabelViewFrame = CGRectMake(nameX, nameY, nameSize.width, nameSize.height);
    
    //VIP
    CGFloat vipX = CGRectGetMaxX(_nameLabelViewFrame) + margin;
    CGFloat vipY = nameY;
    CGFloat vipW = 14;
    CGFloat vipH = 14;
    _vipImageViewFrame = (CGRect){{vipX,vipY},{vipW,vipH}};
    
    //微博内容
    CGFloat textX = iconX;
    CGFloat textY = CGRectGetMaxY(_iconImageViewFrame) + margin;
    CGSize textMaxSize = CGSizeMake(355, MAXFLOAT);
    CGSize textSize = [self sizeText:self.microBlog.text maxSize:textMaxSize fontSize:TEXT_FONT_SIZE];
    
    _contentLabelViewFrame = CGRectMake(textX, textY, textSize.width, textSize.height);
    
    if(self.microBlog.picture){
        //图片
        CGFloat pictureX = iconX;
        CGFloat pictureY = CGRectGetMaxY(_contentLabelViewFrame) + margin;
        CGFloat pictureW = 100;
        CGFloat pictureH = 100;
        
        _pictureImageViewFrame = CGRectMake(pictureX, pictureY, pictureW, pictureH);
    }
    
}

-(CGSize)sizeText:(NSString*)text maxSize:(CGSize)maxSize fontSize:(CGFloat)fontSize{
    CGSize nameSize = [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil].size;
    
    return nameSize;
}

- (CGFloat)rowHeight{
    if (self.microBlog.picture) {
        return CGRectGetMaxY(self.pictureImageViewFrame);
    }else{
        return CGRectGetMaxY(self.contentLabelViewFrame);
    }
}

@end
