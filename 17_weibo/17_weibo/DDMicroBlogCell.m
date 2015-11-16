//
//  DDMicroBlogCell.m
//  17_weibo
//
//  Created by 杜东方 on 15/11/14.
//  Copyright © 2015年 private. All rights reserved.
//


#import "DDMicroBlogCell.h"
#import "DDMicroBlogFrame.h"



@interface DDMicroBlogCell ()

//cell定义的控件使用weak类型
@property(nonatomic,weak)UIImageView *iconImageView;
@property(nonatomic,weak)UILabel *nameLabelView;
@property(nonatomic,weak)UIImageView *vipImageView;
@property(nonatomic,weak)UILabel *contentLabelView;
@property(nonatomic,weak)UIImageView *pictureImageView;

@end

@implementation DDMicroBlogCell



+ (instancetype)micronBlogCellWithTableView:(UITableView *)tableView{
    static NSString *reuseId = @"microBlog";
    
    DDMicroBlogCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    
    if (!cell) {
        cell = [[DDMicroBlogCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
        
    }
    
    return cell;
}

//
/**
 *  生成子控件,这里不能定义控件的frame，因为控件的大小和内容有关，在设置内容时设置；
 往自定义tableViewCell添加控件时，要加到contentView上
 *
 *  @param style           <#style description#>
 *  @param reuseIdentifier <#reuseIdentifier description#>
 *
 *  @return <#return value description#>
 */
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //头像
        UIImageView *iconImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconImageView];
        //注意这里，不是直接通过alloc生成赋值
        self.iconImageView = iconImageView;
        
        //昵称
        UILabel *nameLabelView = [[UILabel alloc] init];
        [self.contentView addSubview:nameLabelView];
        self.nameLabelView = nameLabelView;
        nameLabelView.font = [UIFont systemFontOfSize:NAME_FONT_SIZE];
        
        //vip
        UIImageView *vipImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:vipImageView];
        self.vipImageView = vipImageView;
        
        //content
        UILabel *contentLabelView = [[UILabel alloc] init];
        [self.contentView addSubview:contentLabelView];
        self.contentLabelView = contentLabelView;
        //设置显示全部
        contentLabelView.numberOfLines = 0;
        contentLabelView.font = [UIFont systemFontOfSize:TEXT_FONT_SIZE];
        
        //picture
        UIImageView *pictureImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:pictureImageView];
        self.pictureImageView = pictureImageView;
        
    }
    return self;
}

//- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
//{
//    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
//        
//    }
//    
//    return self;
//}


//设置子控件显示内容
-(void) setSubViewContent{
    DDMicroBlog *micronBlog = self.microBlogFrame.microBlog;
    self.iconImageView.image = [UIImage imageNamed:micronBlog.icon];
    self.nameLabelView.text = micronBlog.name;
    self.vipImageView.image = [UIImage imageNamed:@"vip"];
    
    if (!micronBlog.isVip) {
        self.vipImageView.hidden = YES;
        self.nameLabelView.textColor = [UIColor blackColor];
    }else{
        self.nameLabelView.textColor = [UIColor redColor];
        self.vipImageView.hidden = NO;
    }
    self.contentLabelView.text = micronBlog.text;
    //如果图片不存在，并且设置了图片，后台会打印警告
    if(micronBlog.picture)self.pictureImageView.image = [UIImage imageNamed:micronBlog.picture];
}

//设置子控件的frame

-(void) setSubViewFrame{
    
    self.iconImageView.frame=self.microBlogFrame.iconImageViewFrame;
    self.nameLabelView.frame=self.microBlogFrame.nameLabelViewFrame;
    self.vipImageView.frame=self.microBlogFrame.vipImageViewFrame;
    self.contentLabelView.frame=self.microBlogFrame.contentLabelViewFrame;
    self.pictureImageView.frame=self.microBlogFrame.pictureImageViewFrame;
}

-(CGSize)sizeText:(NSString*)text maxSize:(CGSize)maxSize fontSize:(CGFloat)fontSize{
    CGSize nameSize = [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil].size;
    
    return nameSize;
}



- (void)setMicroBlogFrame:(DDMicroBlogFrame *)microBlogFrame{
    _microBlogFrame = microBlogFrame;
    [self setSubViewContent];
    [self setSubViewFrame];
}

@end
