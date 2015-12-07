//
//  DDFriendGroupHeaderView.m
//  21_qq_frinends
//
//  Created by 杜东方 on 15/11/17.
//  Copyright © 2015年 private. All rights reserved.
//

#import "DDFriendGroupHeaderView.h"
#import "DDFriendGroup.h"


@interface DDFriendGroupHeaderView()

@property(nonatomic,weak)UIButton *nameBtnView;
@property(nonatomic,weak)UILabel *countLabelView;

@end

@implementation DDFriendGroupHeaderView

+(instancetype)friendGroupHeaderViewWithTableView:(UITableView *)tableView{
    static NSString *reuseId = @"groupHeader";
    
    DDFriendGroupHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:reuseId];
    
    if (!headerView) {
        headerView = [[DDFriendGroupHeaderView alloc] initWithReuseIdentifier:reuseId];
    }
    
    return headerView;
}

//创建子控件
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        UIButton *nameBtnView = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:nameBtnView];
        [nameBtnView setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
        [nameBtnView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        nameBtnView.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        nameBtnView.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        nameBtnView.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        [nameBtnView setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg"] forState:UIControlStateNormal];
        [nameBtnView setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg_highlighted"] forState:UIControlStateHighlighted];
        [nameBtnView addTarget:self action:@selector(nameClick) forControlEvents:UIControlEventTouchUpInside];
        
        //设置图片旋转以后变形问题
        nameBtnView.imageView.contentMode = UIViewContentModeCenter;
        nameBtnView.imageView.clipsToBounds = NO;
        
        self.nameBtnView = nameBtnView;
        
        UILabel *countLabelView = [[UILabel alloc] init];
        [self.contentView addSubview:countLabelView];
        countLabelView.textAlignment = NSTextAlignmentRight;
        countLabelView.textColor = [UIColor lightGrayColor];
        self.countLabelView = countLabelView;
        
    }
    
    return self;
}


-(void)nameClick{
    self.friendGroup.expand = !self.friendGroup.isExpand;
    
    if (self.friendGroup.expand) {
        self.nameBtnView.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    }else{
        self.nameBtnView.imageView.transform = CGAffineTransformMakeRotation(0);
    }
    
    if ([self.delegate respondsToSelector:@selector(headerViewDidClickedNameView:)]) {
        [self.delegate headerViewDidClickedNameView:self];
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.nameBtnView.frame = self.bounds;
    
    CGFloat marginRight = 10;
    CGFloat countW = 150;
    CGFloat countH = 30;
    CGFloat countX = self.bounds.size.width - countW - marginRight;
    CGFloat countY = 0;
    
    self.countLabelView.frame = CGRectMake(countX, countY, countW, countH);
}

-(void)setFriendGroup:(DDFriendGroup *)friendGroup{
    _friendGroup = friendGroup;
    
    [self.nameBtnView setTitle:[friendGroup name] forState:UIControlStateNormal];
    //self.nameBtnView.titleLabel.text = [friendGroup name];
    self.countLabelView.text = [NSString stringWithFormat:@"%zd/%zd",friendGroup.online,friendGroup.friends.count];
    
    
    
    if (self.friendGroup.expand) {
        self.nameBtnView.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    }else{
        self.nameBtnView.imageView.transform = CGAffineTransformMakeRotation(0);
    }

}
@end
