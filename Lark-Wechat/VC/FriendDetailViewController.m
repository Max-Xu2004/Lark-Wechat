//
//  FriendDetailViewController.m
//  Lark-Wechat
//
//  Created by 许晋嘉 on 2023/7/9.
//

#import "FriendDetailViewController.h"

@interface FriendDetailViewController ()

@property (nonatomic, strong) UILabel *stuNumLabel;//学号
@property (nonatomic, strong) UILabel *nameLabel;//名字
@property (nonatomic, strong) UILabel *genderLabel;//性别
@property (nonatomic, strong) UILabel *majorLabel;//专业
@property (nonatomic, strong) UILabel *gradeLabel;//年级
@property (nonatomic, strong) UIButton *addFriendBtn;//添加朋友按钮
@property (nonatomic, strong) NSMutableArray *mArray;

@end

@implementation FriendDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"好友详情页";
    [self.view addSubview:self.stuNumLabel];
    [self.view addSubview:self.nameLabel];
    [self.view addSubview:self.genderLabel];
    [self.view addSubview:self.majorLabel];
    [self.view addSubview:self.gradeLabel];
    [self.view addSubview:self.addFriendBtn];
    self.view.backgroundColor = UIColor.whiteColor;
    // Do any additional setup after loading the view.
}

#pragma mark - 懒加载
- (UILabel *)stuNumLabel{
    if(_stuNumLabel == nil){
        _stuNumLabel = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-280)/2, STATUSBARHEIGHT+100, 280, 40)];
        _stuNumLabel.font = [UIFont systemFontOfSize:18];
        _stuNumLabel.textAlignment = NSTextAlignmentCenter;
        _stuNumLabel.layer.cornerRadius = 40;
        _stuNumLabel.text = [@"学号： " stringByAppendingString:self.detailModel.stunum];
        _stuNumLabel.layer.cornerRadius =  20;
        _stuNumLabel.layer.borderColor = [UIColor grayColor].CGColor;
        _stuNumLabel.layer.borderWidth =  3;
    }
    return _stuNumLabel;
}

- (UILabel *)nameLabel{
    if(_nameLabel == nil){
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-280)/2, STATUSBARHEIGHT+150, 280, 40)];
        _nameLabel.font = [UIFont systemFontOfSize:18];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.layer.cornerRadius = 40;
        _nameLabel.text = [@"姓名： " stringByAppendingString:self.detailModel.name];
        _nameLabel.layer.cornerRadius =  20;
        _nameLabel.layer.borderColor = [UIColor grayColor].CGColor;
        _nameLabel.layer.borderWidth =  3;
    }
    return _nameLabel;
}

- (UILabel *)genderLabel{
    if(_genderLabel == nil){
        _genderLabel = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-280)/2, STATUSBARHEIGHT+200, 280, 40)];
        _genderLabel.font = [UIFont systemFontOfSize:18];
        _genderLabel.textAlignment = NSTextAlignmentCenter;
        _genderLabel.layer.cornerRadius = 40;
        _genderLabel.text = [@"性别： " stringByAppendingString:self.detailModel.gender];
        _genderLabel.layer.cornerRadius =  20;
        _genderLabel.layer.borderColor = [UIColor grayColor].CGColor;
        _genderLabel.layer.borderWidth =  3;
    }
    return _genderLabel;
}

- (UILabel *)majorLabel{
    if(_majorLabel == nil){
        _majorLabel = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-280)/2, STATUSBARHEIGHT+250, 280, 40)];
        _majorLabel.font = [UIFont systemFontOfSize:18];
        _majorLabel.textAlignment = NSTextAlignmentCenter;
        _majorLabel.layer.cornerRadius = 40;
        _majorLabel.text = [@"专业： " stringByAppendingString:self.detailModel.major];
        _majorLabel.layer.cornerRadius =  20;
        _majorLabel.layer.borderColor = [UIColor grayColor].CGColor;
        _majorLabel.layer.borderWidth =  3;
    }
    return _majorLabel;
}

- (UILabel *)gradeLabel{
    if(_gradeLabel == nil){
        _gradeLabel = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-280)/2, STATUSBARHEIGHT+300, 280, 40)];
        _gradeLabel.font = [UIFont systemFontOfSize:18];
        _gradeLabel.textAlignment = NSTextAlignmentCenter;
        _gradeLabel.layer.cornerRadius = 40;
        _gradeLabel.text = [@"年级： " stringByAppendingString:self.detailModel.grade];
        _gradeLabel.layer.cornerRadius =  20;
        _gradeLabel.layer.borderColor = [UIColor grayColor].CGColor;
        _gradeLabel.layer.borderWidth =  3;
    }
    return _gradeLabel;
}

- (UIButton *)addFriendBtn {
    if (_addFriendBtn == nil) {
        _addFriendBtn = [[UIButton alloc] init];
        _addFriendBtn.frame = CGRectMake((self.view.frame.size.width-315)/2, STATUSBARHEIGHT+350, 315, 52);
        [_addFriendBtn setTitle:@"添加好友" forState:UIControlStateNormal];
        _addFriendBtn.backgroundColor = [UIColor blueColor];
        [_addFriendBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _addFriendBtn.layer.cornerRadius = 10;
        _addFriendBtn.layer.masksToBounds = YES;
//        [_addFriendBtn addTarget:self action:@selector(addButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _addFriendBtn;
}



#pragma mark -控件设置
- (void)viewdidAppear:(BOOL)animated{
    self.stuNumLabel.text = self.detailModel.stunum;
}

#pragma mark -按钮事件
-(void)addButtonClick:(UIButton*)button{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.mArray = [defaults objectForKey:@"friends"];
    [self.mArray addObject:self.detailModel];
    [defaults setObject:self.mArray forKey:@"friends"];
    [defaults synchronize];
}



@end
