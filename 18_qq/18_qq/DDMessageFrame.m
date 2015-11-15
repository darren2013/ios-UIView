//
//  DDMessageFrame.m
//  18_qq
//
//  Created by 杜东方 on 15/11/15.
//  Copyright © 2015年 private. All rights reserved.
//

#import "DDMessageFrame.h"

@implementation DDMessageFrame

- (void)setMessage:(DDMessage *)message{
    _message = message;
    
    UIScreen *screen = [UIScreen mainScreen];
    CGFloat screenW = screen.bounds.size.width;
    //时间
    CGFloat margin = 10;
    CGFloat timeX = 0;
    CGFloat timeY = 0;
    CGFloat timeW = screenW;
    CGFloat timeH = 40;
    
    if (!message.isTimeHidden) {
        _timeFrame = CGRectMake(timeX, timeY, timeW, timeH);
    }
    
    
    //头像
    CGFloat headW = 40;
    CGFloat headH = 40;
    CGFloat headX = message.type == MessageTypeSelf ? screenW - margin - headW : margin;
    CGFloat headY = CGRectGetMaxY(_timeFrame);
    _headFrame = CGRectMake(headX, headY, headW, headH);
    
    //聊天内容
    CGFloat textY = headH;
    CGSize textMaxSize = [self sizeText:message.text maxSize:CGSizeMake(240, MAXFLOAT) fontSize:TEXT_FONT_SIZE];
    
    textMaxSize.width += TEXT_PADDING*2;
    textMaxSize.height += TEXT_PADDING*2;
    
    CGFloat textX = message.type == MessageTypeSelf ? (headX - margin - textMaxSize.width) : (CGRectGetMaxX(_headFrame) + margin);
    _contentFrame = (CGRect){{textX,textY},textMaxSize};
    
    _rowHeight = MAX(CGRectGetMaxY(_contentFrame), CGRectGetMaxY(_headFrame)) + margin;
}

-(CGSize) sizeText:(NSString*)text maxSize:(CGSize)maxSize fontSize:(CGFloat)fontSize{
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil].size;
}

+ (NSMutableArray *)messageFrameList{
    NSMutableArray *messageFrames = [NSMutableArray array];
    
    for (DDMessage *message in [DDMessage messageList]) {
        DDMessageFrame *messageFrame = [[DDMessageFrame alloc] init];
        messageFrame.message = message;
        [messageFrames addObject:messageFrame];
    }
    
    return messageFrames;
}
@end
