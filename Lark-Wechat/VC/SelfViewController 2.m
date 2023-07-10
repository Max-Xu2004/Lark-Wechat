//
//  SelfViewController.m
//  Lark-Wechat
//
//  Created by 许晋嘉 on 2023/7/9.
//

#import "SelfViewController.h"
#import "LoginViewController.h"
#import "AppDelegate.h"

@interface SelfViewController ()

@property (nonatomic, strong) UIButton *avatar;
@property (nonatomic, strong) UIButton *logout;
@property (nonatomic,assign) bool loginOrNot;

@end

@implementation SelfViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.avatar];
    [self.view addSubview:self.logout];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.loginOrNot = [defaults objectForKey:@"loginOrNot"];
    // Do any additional setup after loading the view.
}

#pragma mark - 懒加载
- (UIButton *)avatar{
    if(_avatar == nil){
        _avatar = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width-100)/2, 100, 100, 100)];
        [_avatar setImage:[UIImage imageNamed:@"avatar"] forState:UIControlStateNormal];
        _avatar.layer.cornerRadius = 50;
        _avatar.layer.masksToBounds = YES;
        
    }
    return _avatar;
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
        [_logout addTarget:self action:@selector(buttonClick3:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _logout;
}

#pragma mark - 退出登录按钮事件
- (void)buttonClick3:(UIButton*)button{
    self.loginOrNot = NO;
    NSLog(@"状态%d",self.loginOrNot);
    [self setupUserDefault];
    [self presentAlertControllerwithTitle:@"退出登录成功"];
    LoginViewController *lvc = [[LoginViewController alloc]init];
    [AppDelegate setRootViewViewController:lvc];
    
}

#pragma mark - 弹出提示框
-(void)presentAlertControllerwithTitle:(NSString *)title{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:NULL preferredStyle:UIAlertControllerStyleAlert];
    [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(performDismiss:) userInfo:nil repeats:NO];
    [self presentViewController:alert animated:YES completion:^{
           
        }];
}
#pragma mark - 计时器
-(void) performDismiss:(NSTimer *)timer
{
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}

#pragma mark - 数据持久化
- (void)setupUserDefault {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    NSLog(@"%@", defaults);
    [defaults setBool:NO forKey:@"loginOrNot"];
    [defaults synchronize];
} //写

- (void)readUserDefaults {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.loginOrNot = [defaults boolForKey:@"loginOrNot"];

//    NSLog(@"name=%@,gender=%@,age=%ld,height=%.1f",name,gender,age,height);
} //读


@end
