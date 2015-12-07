//
//  DDAppInfoCell.m
//  22_appManagment
//
//  Created by 杜东方 on 15/11/21.
//  Copyright © 2015年 private. All rights reserved.
//

#import "DDAppInfoCell.h"
#import "AppInfo.h"

@interface  DDAppInfoCell()

@property (weak, nonatomic) IBOutlet UIImageView *icon;


@property (weak, nonatomic) IBOutlet UILabel *name;

@property (weak, nonatomic) IBOutlet UILabel *sizeDownloadInfo;
@property (weak, nonatomic) IBOutlet UIButton *downloadBtn;

- (IBAction)downloadClick;

@end

@implementation DDAppInfoCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setAppInfo:(AppInfo *)appInfo{
    _appInfo = appInfo;
    
    self.icon.image = [UIImage imageNamed:appInfo.icon];
    self.name.text = appInfo.name;
    self.sizeDownloadInfo.text = [NSString stringWithFormat:@"%@|已下载%@",appInfo.size,appInfo.download];
}

- (IBAction)downloadClick {
    self.downloadBtn.enabled = NO;
    
    
    if ([self.delegate respondsToSelector:@selector(appInfoCellDownloadBtnDidClicked:)]) {
        [self.delegate appInfoCellDownloadBtnDidClicked:self];
    }
    
    
}
@end
