//
//  ViewController.m
//  18_qq
//
//  Created by 杜东方 on 15/11/15.
//  Copyright © 2015年 private. All rights reserved.
//

#import "ViewController.h"
#import "DDMessage.h"
#import "DDMessageCell.h"
#import "DDMessageFrame.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>

@property(nonatomic,strong)NSMutableArray *messageFrames;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //NSLog(@"%@",self.messages);
   // self.tableView.rowHeight = 200;
    
    //去掉分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //不允许选中
    self.tableView.allowsSelection = NO;
    
    self.tableView.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    [self locatLastRow];
}


-(void) keyboardWillChangeFrame:(NSNotification*)noti{
    //NSLog(@"%@",noti.userInfo);
    
//    {
//        UIKeyboardAnimationCurveUserInfoKey = 7;
//        UIKeyboardAnimationDurationUserInfoKey = "0.25";
//        UIKeyboardBoundsUserInfoKey = "NSRect: {{0, 0}, {375, 216}}";
//        UIKeyboardCenterBeginUserInfoKey = "NSPoint: {187.5, 775}";
//        UIKeyboardCenterEndUserInfoKey = "NSPoint: {187.5, 775}";
//        UIKeyboardFrameBeginUserInfoKey = "NSRect: {{0, 667}, {375, 216}}";
//        UIKeyboardFrameEndUserInfoKey = "NSRect: {{0, 667}, {375, 216}}";
//        UIKeyboardIsLocalUserInfoKey = 1;
//    }
    
    CGFloat duration = [noti.userInfo[@"UIKeyboardAnimationDurationUserInfoKey"] floatValue];
    CGRect rect = [noti.userInfo[@"UIKeyboardFrameEndUserInfoKey"] CGRectValue];
    
    CGFloat offsetY = rect.origin.y - self.view.frame.size.height;
    [UIView animateWithDuration:duration animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(0, offsetY);
    }];
    
    
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (BOOL)prefersStatusBarHidden{
    return YES;
}

- (NSMutableArray *)messageFrames{
    if (!_messageFrames) {
        _messageFrames = [DDMessageFrame messageFrameList];
    }
    
    return _messageFrames;
}

#pragma mark - table view datasource 方法实现

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.messageFrames.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //1.生成可重用的自定义cell
    DDMessageCell *cell = [DDMessageCell messageCellWithTableView:tableView];
    
    //2.给子控件赋值
    cell.messageFrame = self.messageFrames[indexPath.row];
    
    return cell;
}

#pragma mark - table view delegate 实现

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self.messageFrames[indexPath.row] rowHeight];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.view endEditing:YES];
}

#pragma mark - textField 代理方法实现

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSString *text = textField.text;
    [self sendMsg:text withType:MessageTypeSelf];
    
    [self sendMsg:@"gook luck" withType:MessageTypeOther];
    return YES;
}

- (void)sendMsg:(NSString*)text withType:(MessageType)type{
    DDMessage *message = [[DDMessage alloc] init];
    message.text = text;
    message.type = type;
    
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"HH:mm";
    message.time = [formatter stringFromDate:date];
    
    DDMessageFrame *lastMsgFrame = [self.messageFrames lastObject];
    DDMessage *lastMsg = lastMsgFrame.message;
    
    if ([message.time isEqualToString:lastMsg.time]) {
        message.timeHidden = YES;
    }
    
    DDMessageFrame *msgFrame = [[DDMessageFrame alloc] init];
    msgFrame.message = message;
    
    [self.messageFrames addObject:msgFrame];
    
    [self.tableView reloadData];
    
    [self locatLastRow];
}

-(void) locatLastRow{
    NSIndexPath *lastIndexPath = [NSIndexPath indexPathForRow:self.messageFrames.count -1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:lastIndexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}

@end
