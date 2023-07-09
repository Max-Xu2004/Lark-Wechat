//
//  MainViewController.m
//  Lark-Wechat
//
//  Created by 许晋嘉 on 2023/6/26.
//

#import "MainViewController.h"
#import "SelfViewController.h"

@interface MainViewController ()<
UITableViewDelegate,
UITableViewDataSource
>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) NSArray *dataArray;

@property (nonatomic,strong) UIButton *avatar; //登陆的头像按钮

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    // Do any additional setup after loading the view.
}

#pragma mark -DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MessageModel *dataModel = self.dataArray[indexPath.row];
    ///复用
    static NSString *messagePageCellID = @"messagePageCellID";
    MessageTableViewCell *messageCell = [tableView dequeueReusableCellWithIdentifier:messagePageCellID];
    if(messageCell == nil){
        messageCell = [[MessageTableViewCell alloc] init];
        ///数据传递
        messageCell.personLab.text = dataModel.person;
        messageCell.dateLab.text = dataModel.date;
        messageCell.tLab.text = dataModel.text;
        messageCell.imgView.image = [UIImage imageNamed:dataModel.imgName];
        messageCell.dateLab.text = dataModel.date;
        NSInteger isBell = [dataModel.bell integerValue];
        if(isBell){
            messageCell.bellImgView.image = [UIImage imageNamed:@"bellNo"];
        }
        else messageCell.bellImgView.image = [UIImage imageNamed:@"bellYes"];
    }
    return messageCell;
}


#pragma mark - 懒加载
- (NSArray<MessageModel *> *)dataArray{
    if(_dataArray == nil){
        _dataArray = [NSArray array];
        NSArray *dataOriginArray = @[
            @{@"person" : @"王同学",
              @"text" : @"你好呀",
              @"image" : @"avatar",
              @"date" : @"16:30",
              @"bell" : @1},
            @{@"person" : @"李同学",
              @"text" : @"你好呀",
              @"image" : @"avatar",
              @"date" : @"17:30",
              @"bell" : @0},
            @{@"person" : @"张同学",
              @"text" : @"你好呀",
              @"image" : @"avatar",
              @"date" : @"18:30",
              @"bell" : @1},
            @{@"person" : @"孙同学",
              @"text" : @"你好呀",
              @"image" : @"avatar",
              @"date" : @"19:30",
              @"bell" : @0},
            @{@"person" : @"王同学",
              @"text" : @"你好呀",
              @"image" : @"avatar",
              @"date" : @"16:30",
              @"bell" : @1},
            @{@"person" : @"李同学",
              @"text" : @"你好呀",
              @"image" : @"avatar",
              @"date" : @"17:30",
              @"bell" : @0},
            @{@"person" : @"张同学",
              @"text" : @"你好呀",
              @"image" : @"avatar",
              @"date" : @"18:30",
              @"bell" : @1},
            @{@"person" : @"孙同学",
              @"text" : @"你好呀",
              @"image" : @"avatar",
              @"date" : @"19:30",
              @"bell" : @0},
            @{@"person" : @"王同学",
              @"text" : @"你好呀",
              @"image" : @"avatar",
              @"date" : @"16:30",
              @"bell" : @1},
            @{@"person" : @"李同学",
              @"text" : @"你好呀",
              @"image" : @"avatar",
              @"date" : @"17:30",
              @"bell" : @0},
            @{@"person" : @"张同学",
              @"text" : @"你好呀",
              @"image" : @"avatar",
              @"date" : @"18:30",
              @"bell" : @1},
            @{@"person" : @"孙同学",
              @"text" : @"你好呀",
              @"image" : @"avatar",
              @"date" : @"19:30",
              @"bell" : @0}
        ];
        NSMutableArray *ma = [NSMutableArray array];
        for (NSDictionary *dic in dataOriginArray){
            MessageModel *model = [[MessageModel alloc] init];
            [model messageModelWithDic:dic];
            [ma addObject:model];
        }
        _dataArray = ma;
    }
    return _dataArray;
}

- (UITableView *)tableView{
    if(_tableView == nil){
        _tableView = [[UITableView alloc] init];
        _tableView.frame = CGRectMake(0, 50+STATUSBARHEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-20-50);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

- (UIButton *)avatar{
    if(_avatar == nil){
        _avatar = [[UIButton alloc]initWithFrame:CGRectMake(15, STATUSBARHEIGHT, 40, 40)];
        [_avatar setImage:[UIImage imageNamed:@"avatar"] forState:UIControlStateNormal];
        _avatar.layer.cornerRadius = 20;
        _avatar.layer.masksToBounds = YES;
        [_avatar addTarget:self action:@selector(avatarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _avatar;
}

#pragma mark - 头像按钮事件
- (void)avatarButtonClick:(UIButton*)button{
    SelfViewController *selfView = [[SelfViewController alloc] init];
    [self.navigationController pushViewController:selfView animated:YES];
}

#pragma mark - 控件调整
- (void)viewWillDisappear:(BOOL)animated{
    [self.avatar removeFromSuperview];
}

- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController.view addSubview:self.avatar];
}


@end
