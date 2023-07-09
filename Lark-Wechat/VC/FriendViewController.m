//
//  FriendViewController.m
//  Lark-Wechat
//
//  Created by 许晋嘉 on 2023/6/26.
//

#import "FriendViewController.h"
#import "AddViewController.h"

@interface FriendViewController ()

@end

@implementation FriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.view addSubview:self.add];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = NO;
    [self.navigationController.view addSubview:self.add];
}

- (void)viewWillDisappear:(BOOL)animated{
    [self.add removeFromSuperview];
}

#pragma mark -懒加载
- (UIButton *)add{
    if(_add == nil){
        _add = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-15-40, STATUSBARHEIGHT, 40, 40)];
        [_add setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
        [_add addTarget:self action:@selector(addButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _add;
}

#pragma mark - 添加好友按钮事件
- (void)addButtonClick:(UIButton*)button{
    AddViewController *addView = [[AddViewController alloc] init];
    [self.navigationController pushViewController:addView animated:YES];
}
@end
