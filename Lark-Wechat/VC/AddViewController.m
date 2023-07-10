//
//  AddViewController.m
//  Lark-Wechat
//
//  Created by 许晋嘉 on 2023/7/8.
//

#import "AddViewController.h"

@interface AddViewController ()

@property (nonatomic, strong) UITextField *addFriendTextField;//输入学号搜索联系人
@property (nonatomic, strong) UIButton *addButton;//添加好友按钮

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"添加好友";
    [self.view addSubview:self.addFriendTextField];
    [self.view addSubview:self.addButton];
    self.view.backgroundColor = UIColor.whiteColor;
    
    
    // Do any additional setup after loading the view.
}

#pragma mark - 懒加载
- (UITextField *)addFriendTextField{
    if(_addFriendTextField == nil){
        _addFriendTextField = [[UITextField alloc] initWithFrame:CGRectMake((self.view.frame.size.width-280)/2, STATUSBARHEIGHT+80, 280, 40)];
        _addFriendTextField.font = [UIFont systemFontOfSize:18];
        _addFriendTextField.secureTextEntry = NO;
        _addFriendTextField.placeholder = @"请输入学号";
        _addFriendTextField.textAlignment = NSTextAlignmentCenter;
        _addFriendTextField.layer.cornerRadius = 40;
        _addFriendTextField.borderStyle = UITextBorderStyleRoundedRect;
        _addFriendTextField.keyboardType = UIKeyboardTypeNumberPad;
        _addFriendTextField.returnKeyType = UIReturnKeyRoute;
    }
    return _addFriendTextField;
}

- (UIButton *)addButton {
    if (_addButton == nil) {
        _addButton = [[UIButton alloc] init];
        _addButton.frame = CGRectMake((self.view.frame.size.width-315)/2, 320, 315, 52);
        [_addButton setTitle:@"搜索好友" forState:UIControlStateNormal];
        _addButton.backgroundColor = [UIColor blueColor];
        [_addButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _addButton.layer.cornerRadius = 10;
        _addButton.layer.masksToBounds = YES;
        
        [_addButton addTarget:self action:@selector(addButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _addButton;
}

#pragma mark - 搜索好友按钮点击事件
- (void)addButtonClick:(UIButton*)button{
    [SessionManager getDataWithStuNum:self.addFriendTextField.text Success:^(NSArray * _Nonnull array) {
        if([array count]>0){
            FriendModel *model = array[0];
            FriendDetailViewController *detailVC = [[FriendDetailViewController alloc] init];
            detailVC.detailModel = model;
            [self.navigationController pushViewController:detailVC animated:YES];
        }
        else [self presentAlertControllerwithTitle:@"请输入正确学号！"];
        } Failure:^{
            NSLog(@"Error ");
        }];
}
    

#pragma mark - 控件处理
- (void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = YES;
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


@end
