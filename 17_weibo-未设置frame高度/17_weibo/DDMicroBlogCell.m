//
//  DDMicroBlogCell.m
//  17_weibo
//
//  Created by 杜东方 on 15/11/14.
//  Copyright © 2015年 private. All rights reserved.
//

//定义宏
#import "DDMicroBlogCell.h"
#import "DDMicroBlog.h"

#define NAME_FONT_SIZE 15
#define TEXT_FONT_SIZE 14

@interface DDMicroBlogCell ()

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
 *  生成子控件,这里不能定义控件的frame，因为控件的大小和内容有关，在设置内容时设置
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
    self.iconImageView.image = [UIImage imageNamed:self.microBlog.icon];
    self.nameLabelView.text = self.microBlog.name;
    self.vipImageView.image = [UIImage imageNamed:@"vip"];
    
    if (!self.microBlog.isVip) {
        self.vipImageView.hidden = YES;
        self.nameLabelView.textColor = [UIColor blackColor];
    }else{
        self.nameLabelView.textColor = [UIColor redColor];
        self.vipImageView.hidden = NO;
    }
    self.contentLabelView.text = self.microBlog.text;
    self.pictureImageView.image = [UIImage imageNamed:self.microBlog.picture];
}

//设置子控件的frame

-(void) setSubViewFrame{
    CGFloat iconW = 30;
    CGFloat iconH = 30;
    CGFloat margin = 10;
    CGFloat iconX = margin;
    CGFloat iconY = margin;
    //头像位置
    self.iconImageView.frame = CGRectMake(iconX, iconY, iconW, iconH);
    
    //昵称
    CGSize maxSize = CGSizeMake(MAXFLOAT, MAXFLOAT);
    
    //计算文本大小
//    CGSize nameSize = [self.microBlog.name boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:NAME_FONT_SIZE]} context:nil].size;
    
    CGSize nameSize = [self sizeText:self.microBlog.name maxSize:maxSize fontSize:NAME_FONT_SIZE];
    
    CGFloat nameX = CGRectGetMaxX(self.iconImageView.frame) + margin;
    CGFloat nameY = iconY + (iconH - nameSize.height)/2;
    self.nameLabelView.frame = CGRectMake(nameX, nameY, nameSize.width, nameSize.height);
    
    //VIP
    CGFloat vipX = CGRectGetMaxX(self.nameLabelView.frame) + margin;
    CGFloat vipY = nameY;
    CGFloat vipW = 14;
    CGFloat vipH = 14;
    self.vipImageView.frame = (CGRect){{vipX,vipY},{vipW,vipH}};
    
    //微博内容
    CGFloat textX = iconX;
    CGFloat textY = CGRectGetMaxY(self.iconImageView.frame) + margin;
    CGSize textMaxSize = CGSizeMake(355, MAXFLOAT);
    CGSize textSize = [self sizeText:self.microBlog.text maxSize:textMaxSize fontSize:TEXT_FONT_SIZE];
    
    self.contentLabelView.frame = CGRectMake(textX, textY, textSize.width, textSize.height);
    
    //图片
    CGFloat pictureX = iconX;
    CGFloat pictureY = CGRectGetMaxY(self.contentLabelView.frame) + margin;
    CGFloat pictureW = 100;
    CGFloat pictureH = 100;
    
    self.pictureImageView.frame = CGRectMake(pictureX, pictureY, pictureW, pictureH);
    
    
}

-(CGSize)sizeText:(NSString*)text maxSize:(CGSize)maxSize fontSize:(CGFloat)fontSize{
    CGSize nameSize = [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil].size;
    
    return nameSize;
}

- (void)setMicroBlog:(DDMicroBlog *)microBlog{
    _microBlog = microBlog;
    
    [self setSubViewContent];
    [self setSubViewFrame];
}

@end
