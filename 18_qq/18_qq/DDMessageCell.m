//
//  DDMessageCell.m
//  18_qq
//
//  Created by 杜东方 on 15/11/15.
//  Copyright © 2015年 private. All rights reserved.
//

#import "DDMessageCell.h"
#import "DDMessage.h"
#import "DDMessageFrame.h"
#import "UIImage+Extend.h"




@interface DDMessageCell ()
@property(nonatomic,weak)UILabel *timeLabelView;
@property(nonatomic,weak)UIImageView *headImageView;
//由于要设置背景图片，并且按住内容会弹出一些框，所以使用button，而不是使用UILabel
@property(nonatomic,weak)UIButton *contentBtnView;


@end

@implementation DDMessageCell

+(instancetype)messageCellWithTableView:(UITableView *)tableView{
    static NSString *reuseId = @"message";
    
    DDMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    
    if (!cell) {
        cell = [[DDMessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
    }
    
    return cell;
}

//添加cell子控件
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor clearColor];
       //时间
        UILabel *timeLabelView = [[UILabel alloc] init];
        timeLabelView.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:timeLabelView];
        self.timeLabelView = timeLabelView;
        
        
        //头像
        UIImageView *headImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:headImageView];
        headImageView.layer.cornerRadius = 25;
        headImageView.layer.masksToBounds = YES;
        self.headImageView = headImageView;
        
        //内容
        UIButton *contentBtnView = [[UIButton alloc] init];
        contentBtnView.titleLabel.font = [UIFont systemFontOfSize:TEXT_FONT_SIZE];
        [contentBtnView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        contentBtnView.titleLabel.numberOfLines = 0;
        contentBtnView.contentEdgeInsets = UIEdgeInsetsMake(TEXT_PADDING, TEXT_PADDING, TEXT_PADDING, TEXT_PADDING);
        
        //[contentBtnView setBackgroundColor:[UIColor redColor]];
        //contentBtnView.titleLabel.backgroundColor = [UIColor whiteColor];
        
        [self.contentView addSubview:contentBtnView];
        self.contentBtnView = contentBtnView;
    }
    
    return self;
}

- (void)setViewValue{
    DDMessage *message = self.messageFrame.message;
    //时间
    self.timeLabelView.text = message.time;
    
    //头像赋值
    NSString *headerName = message.type == MessageTypeSelf ? @"me" : @"other";
    self.headImageView.image = [UIImage imageNamed:headerName];
    
    //聊天内容
    [self.contentBtnView setTitle:message.text forState:UIControlStateNormal];
    
    if (message.type == MessageTypeSelf) {
        //UIImage *chatSendNorImage = [UIImage imageNamed:@"chat_send_nor"];
        
//        chatSendNorImage = [chatSendNorImage stretchableImageWithLeftCapWidth:chatSendNorImage.size.width * 0.5 topCapHeight:chatSendNorImage.size.height * 0.5];
        
       // chatSendNorImage = [self resizeImage:chatSendNorImage];
        
        [self.contentBtnView setBackgroundImage:[UIImage resizeImage:@"chat_send_nor"] forState:UIControlStateNormal];
        [self.contentBtnView setBackgroundImage:[UIImage resizeImage:@"chat_send_press_pic"] forState:UIControlStateHighlighted];
    }else{
        [self.contentBtnView setBackgroundImage:[UIImage resizeImage:@"chat_recive_nor"] forState:UIControlStateNormal];
        [self.contentBtnView setBackgroundImage:[UIImage resizeImage:@"chat_recive_press_pic"] forState:UIControlStateHighlighted];
    }
}

//-(UIImage*)resizeImage:(UIImage*)image{
//    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
//}

-(void)setViewFrame{
    self.timeLabelView.frame = self.messageFrame.timeFrame;
    
    self.headImageView.frame = self.messageFrame.headFrame;
    
    self.contentBtnView.frame = self.messageFrame.contentFrame;
    
//    if (_messageFrame.message.isTimeHidden) {
//        self.timeLabelView.hidden = YES;
//    }
}


- (void)setMessageFrame:(DDMessageFrame *)messageFrame{
    _messageFrame = messageFrame;
    
    //给子控件赋值
    [self setViewValue];
    
    //设置子控件的frame
    [self setViewFrame];
}

@end
