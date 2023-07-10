//
//  SelfViewController.m
//  Lark-Wechat
//
//  Created by 许晋嘉 on 2023/7/9.
//

#import "SelfViewController.h"
#import "AppDelegate.h"
#import "LoginViewController.h"

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
        
        NSData *storedImageData = [[NSUserDefaults standardUserDefaults] objectForKey:@"AvatarImage"];

        if (storedImageData != nil) {
            // 值不为空
            UIImage *storedImage = [UIImage imageWithData:storedImageData];
            [_avatar setImage:storedImage forState:UIControlStateNormal];
            // 执行更换头像
        } else {
            // 值为空，设置默认头像
            [_avatar setImage:[UIImage imageNamed:@"avatar"] forState:UIControlStateNormal];
        }
        
//        [_avatar setImage:[UIImage imageNamed:@"avatar"] forState:UIControlStateNormal];
        _avatar.layer.cornerRadius = 50;
        _avatar.layer.masksToBounds = YES;
        [_avatar addTarget:self action:@selector(buttonClick1:) forControlEvents:UIControlEventTouchUpInside];
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

#pragma mark - 按钮事件
- (void)buttonClick3:(UIButton*)button{
    [self presentAlertControllerwithTitle:@"退出登录成功"];
    self.loginOrNot = NO;
    NSLog(@"状态%d",self.loginOrNot);
    [self setupUserDefault];
    LoginViewController *lvc = [[LoginViewController alloc]init];
    [AppDelegate setRootViewViewController:lvc];
}//登陆按钮

- (void)buttonClick1:(UIButton*)button{
    
    UIImagePickerController * imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.editing = YES;
        imagePicker.delegate = self;
        imagePicker.allowsEditing = YES;
        imagePicker.modalPresentationStyle = UIModalPresentationFullScreen;
    //创建sheet提示框，提示选择相机还是相册
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"请选择照片来源" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
         UIAlertAction * camera = [UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

          //选择相机时，设置UIImagePickerController对象相关属性
          imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
          imagePicker.modalPresentationStyle = UIModalPresentationFullScreen;
          imagePicker.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
          //跳转到UIImagePickerController控制器弹出相机
          [self presentViewController:imagePicker animated:YES completion:nil];
        }];

        //相册选项
        UIAlertAction * photo = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

          //选择相册时，设置UIImagePickerController对象相关属性
          imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            imagePicker.modalPresentationStyle = UIModalPresentationPageSheet;
          //跳转到UIImagePickerController控制器弹出相册
          [self presentViewController:imagePicker animated:YES completion:nil];
        }];

        //取消按钮
        UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {

          [self dismissViewControllerAnimated:YES completion:nil];
        }];
        //添加各个按钮事件
        [alert addAction:camera];
        [alert addAction:photo];
        [alert addAction:cancel];
        //弹出sheet提示框
        [self presentViewController:alert animated:YES completion:nil];
}//头像按钮

#pragma mark - 选择图片后头像设置和数据持久化
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {

  [picker dismissViewControllerAnimated:YES completion:nil];
  //获取到的图片
  UIImage * image = [info valueForKey:UIImagePickerControllerEditedImage];
    // 存储头像
    NSData *imageData = UIImagePNGRepresentation(image);
    [[NSUserDefaults standardUserDefaults] setObject:imageData forKey:@"AvatarImage"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [_avatar setImage:image forState:UIControlStateNormal];
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
    NSLog(@"%@", defaults);
    [defaults setBool:self.loginOrNot forKey:@"loginOrNot"];
    [defaults synchronize];
// 强制让数据立刻保存
} //写

- (void)readUserDefaults {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.loginOrNot = [defaults boolForKey:@"loginOrNot"];
} //读


- (void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = YES;
}

@end
