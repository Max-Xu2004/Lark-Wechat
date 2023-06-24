//
//  LoginViewController.m
//  Lark+Wechat
//
//  Created by 许晋嘉 on 2023/6/3.
//

#import "LoginViewController.h"
#import "Masonry.h"

#define stautsBarHeight ([UIApplication sharedApplication].statusBarFrame.size.height) //定义状态栏高度常量

@interface LoginViewController ()
@property (nonatomic, strong) UILabel *login;  //登录大字提示
@property (nonatomic, strong) UILabel *tip;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UIButton *logout;
@property (nonatomic, strong) UITextField *textFieldaccount;
@property (nonatomic, strong) UITextField *textFieldpassword;
@property (nonatomic, strong) UILabel *accountLabel;
@property (nonatomic, strong) UILabel *passwordLabel;
@property (nonatomic, strong) UIButton *confirm;
@property (nonatomic, strong) UIImageView *avatar;
@property (nonatomic, strong) UIButton *back;
@property(nonatomic,assign) bool loginOrNot;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
//    UIScreenEdgePanGestureRecognizer *edgeGes = [[UIScreenEdgePanGestureRecognizer alloc]  initWithTarget: self  action:@selector(edgePan:)];
//        edgeGes.edges = UIRectEdgeLeft;
//    [self.view addGestureRecognizer:edgeGes];
    [self.view addSubview:self.back];
    [self.view addSubview:self.accountLabel];
    [self.view addSubview:self.passwordLabel];
    [self.back addTarget:self action:@selector(buttonClick2:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.back mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view).mas_offset(45);
            make.left.equalTo(self.view).mas_offset(22);
            make.width.mas_equalTo(30);
            make.height.mas_equalTo(30);
    }];
    // Do any additional setup after loading the view.
}
-(void)change{
    self.confirm.selected=!self.confirm.selected;
    if(self.confirm.selected){
        [_confirm setImage:[UIImage imageNamed:@"勾勾"] forState:UIControlStateNormal];
    }
    else{
        [_confirm setImage:[UIImage imageNamed:@"Image"] forState:UIControlStateNormal];
    }
}
#pragma mark - 登录按钮事件
- (void)buttonClick1:(UIButton*)button{
    if(self.confirm.selected == YES){
        if([self.textFieldaccount.text isEqual: @"redrock"]&&[self.textFieldpassword.text isEqual: @"123456"]){
            [self presentAlertControllerwithTitle:@"登录成功"];
             
            self.
        }
        else [self presentAlertControllerwithTitle:@"账号或密码错误"];
    }
    else [self presentAlertControllerwithTitle:@"请同意用户协议"];
    [self setupUserDefault];
}
#pragma mark - 退出登录按钮事件
- (void)buttonClick3:(UIButton*)button{
    [self presentAlertControllerwithTitle:@"退出登录成功"];
    [self.avatar removeFromSuperview];
    [self.logout removeFromSuperview];
    [self.logout removeTarget:self action:@selector(buttonClick3:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.login];
    [self.view addSubview:self.tip];
    [self.view addSubview:self.button];
    [self.view addSubview:self.textFieldaccount];
    [self.view addSubview:self.textFieldpassword];
    [self.view addSubview:self.confirm];
    [self.confirm addTarget:self action:@selector(change) forControlEvents:UIControlEventTouchUpInside];
    [self.button addTarget:self action:@selector(buttonClick1:) forControlEvents:UIControlEventTouchUpInside];
    self.loginOrNot = NO;
    NSLog(@"%d",self.loginOrNot);
    [self setupUserDefault];
    
}



#pragma mark- 懒加载
- (UILabel *)login {
    if (_login == nil) {
        _login = [[UILabel alloc]init];
        _login.text = @"登录";
        _login.numberOfLines = 0;
        _login.font = [UIFont boldSystemFontOfSize:32];
        _login.textColor = [UIColor blackColor];
        _login.frame = CGRectMake((self.view.frame.size.width-70)/2, stautsBarHeight+30, 70, 48);
    }
    return _login;
}

- (UILabel *)tip {
    if (_tip == nil) {
        _tip = [[UILabel alloc]init];
        _tip.text = @"我同意《用户协议》和《个人信息保护指引》";
        _tip.numberOfLines = 1;
        _tip.font = [UIFont boldSystemFontOfSize:14];
        _tip.textColor = [UIColor systemFillColor];
        _tip.frame = CGRectMake((self.view.frame.size.width-320)/2+20, 460, 300, 15);
    }
    return _tip;
}

- (UIButton *)button {
    if (_button == nil) {
        _button = [[UIButton alloc] init];
        _button.frame = CGRectMake((self.view.frame.size.width-315)/2, 520, 315, 52);
        [_button setTitle:@"登录" forState:UIControlStateNormal];
        _button.backgroundColor = [UIColor blueColor];
        [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _button.layer.cornerRadius = 10;
        _button.layer.masksToBounds = YES;
        
    }
    return _button;
}

- (UIButton *)confirm {
    if (_confirm == nil) {
        _confirm = [[UIButton alloc] init];
        _confirm.frame = CGRectMake((self.view.frame.size.width-320)/2, 460, 18, 18);
        [_confirm setImage:[UIImage imageNamed:@"Image"] forState:UIControlStateNormal];
        _confirm.backgroundColor = [UIColor whiteColor];
        [_confirm setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _confirm.layer.cornerRadius = 10;
        _confirm.layer.masksToBounds = YES;
        
    }
    return _confirm;
}


- (UITextField *)textFieldaccount {
    if (_textFieldaccount == nil) {
        _textFieldaccount = [[UITextField alloc] initWithFrame:CGRectMake((self.view.frame.size.width-247-50)/2+50, stautsBarHeight+130, 247, 40)];
        _textFieldaccount.font = [UIFont systemFontOfSize:18];
        _textFieldaccount.secureTextEntry = NO;
        _textFieldaccount.placeholder = @"请输入账号";
        
        
    }
    return _textFieldaccount;
}

- (UITextField *)textFieldpassword {
    if (_textFieldpassword == nil) {
        _textFieldpassword = [[UITextField alloc] initWithFrame:CGRectMake((self.view.frame.size.width-247-50)/2+50, stautsBarHeight+195, 247, 40)];
        _textFieldpassword.font = [UIFont systemFontOfSize:18];
        _textFieldpassword.secureTextEntry = YES;
        _textFieldpassword.placeholder = @"请输入密码";
        
        
    }
    return _textFieldpassword;
}

- (UILabel *)accountLabel{
    if(_accountLabel == nil) {
        _accountLabel = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-247-50)/2, stautsBarHeight+130, 50, 40)];
        _accountLabel.font = [UIFont systemFontOfSize:18];
        _accountLabel.text = @"账号";
    }
    return _accountLabel;
}

- (UILabel *)passwordLabel{
    if(_passwordLabel == nil) {
        _passwordLabel = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-247-50)/2, stautsBarHeight+195, 50, 40)];
        _passwordLabel.font = [UIFont systemFontOfSize:18];
        _passwordLabel.text = @"密码";
    }
    return _passwordLabel;
}

- (UIButton *)back{
    if(_back == nil){
        _back = [[UIButton alloc]init];
        [_back setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    }
    return _back;
}

- (UIButton *)logout {
    if (_logout == nil) {
        _logout = [[UIButton alloc] init];
        _logout.frame = CGRectMake((self.view.frame.size.width-315)/2, 520, 315, 52);
        [_logout setTitle:@"退出登录" forState:UIControlStateNormal];
        _logout.backgroundColor = [UIColor blueColor];
        [_logout setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _logout.layer.cornerRadius = 10;
        _logout.layer.masksToBounds = YES;
        
    }
    return _logout;
}

- (UIImageView *)avatar{
    if(_avatar == nil){
        _avatar = [[UIImageView alloc]initWithFrame:CGRectMake((self.view.frame.size.width-100)/2, 100, 100, 100)];
        _avatar.image = [UIImage imageNamed:@"touxiang"];
    }
    return  _avatar;
}
#pragma mark - 弹出提示框
-(void)presentAlertControllerwithTitle:(NSString *)title{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:NULL preferredStyle:UIAlertControllerStyleAlert];
    [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(performDismiss:) userInfo:nil repeats:NO];
    [self presentViewController:alert animated:YES completion:^{
           
        }];
}
#pragma mark - 自动消失计时器
-(void) performDismiss:(NSTimer *)timer
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

#pragma mark - 数据持久化
- (void)setupUserDefault {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSLog(@"%@", defaults);
    [defaults setBool:self.loginOrNot forKey:@"loginOrNot"];
    [defaults setObject:self.textFieldaccount.text forKey:@"account"];
    [defaults setObject:self.textFieldpassword.text forKey:@"password"];
    [defaults synchronize];
// 强制让数据立刻保存
//    [defaults synchronize];

} //写

- (void)readUserDefaults {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.loginOrNot = [defaults boolForKey:@"loginOrNot"];
    self.textFieldaccount.text = [defaults objectForKey:@"account"];
    self.textFieldpassword.text = [defaults objectForKey:@"password"];

//    NSLog(@"name=%@,gender=%@,age=%ld,height=%.1f",name,gender,age,height);
} //读

- (void)viewDidAppear:(BOOL)animated{
    [self readUserDefaults];
    NSLog(@"%d",self.loginOrNot);
    if(self.loginOrNot == NO){
        [self.view addSubview:self.login];
        [self.view addSubview:self.tip];
        [self.view addSubview:self.button];
        [self.view addSubview:self.textFieldaccount];
        [self.view addSubview:self.textFieldpassword];
        [self.view addSubview:self.confirm];
        [self.confirm addTarget:self action:@selector(change) forControlEvents:UIControlEventTouchUpInside];
        [self.button addTarget:self action:@selector(buttonClick1:) forControlEvents:UIControlEventTouchUpInside];
    }
    if(self.loginOrNot == YES){
        [self.view addSubview:self.logout];
        [self.view addSubview:self.avatar];
        [self.logout addTarget:self action:@selector(buttonClick3:) forControlEvents:UIControlEventTouchUpInside];
    }
}

@end
