//
//  FriendViewController.m
//  Lark-Wechat
//
//  Created by 许晋嘉 on 2023/6/26.
//

#import "FriendViewController.h"
#import "AddViewController.h"

@interface FriendViewController ()<
UITableViewDelegate,
UITableViewDataSource
>

@property (nonatomic, strong) UITableView *tableView; // 联系人列表
@property (nonatomic, strong) NSArray<NSString *> *indexTitles; // 索引标题（A-Z）
@property (nonatomic, strong) NSMutableDictionary<NSString *, NSArray *> *contactsDictionary; // 按字母分组的联系人字典
@property (nonatomic,strong) NSMutableArray *contactsArray;


@end

@implementation FriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化联系人列表和索引标题数组
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    self.indexTitles = @[@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z"];
    
    // 获取联系人列表数据并按姓氏拼音分组
    [self fetchContacts];
}

- (void)fetchContacts {
    // 获取联系人数据，具体方法根据您的实际需求实现
    NSArray *contactsArray = [self getContactsData];
    
    // 初始化联系人字典
    self.contactsDictionary = [NSMutableDictionary dictionary];
    
    // 将联系人按姓氏拼音分组
    for (NSString *indexTitle in self.indexTitles) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"lastName BEGINSWITH[cd] %@", indexTitle];
        NSArray *filteredArray = [contactsArray filteredArrayUsingPredicate:predicate];
        
        if ([filteredArray count] > 0) {
            self.contactsDictionary[indexTitle] = filteredArray;
        }
    }
    
    // 刷新表格视图
    [self.tableView reloadData];
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


- (NSArray *)getContactsData{
    return self.contactsArray;
}


#pragma mark - test
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.indexTitles count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString *indexTitle = self.indexTitles[section];
    NSArray *contactsInSection = self.contactsDictionary[indexTitle];
    return [contactsInSection count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"ContactCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    NSString *indexTitle = self.indexTitles[indexPath.section];
    NSArray *contactsInSection = self.contactsDictionary[indexTitle];
    NSString *contactName = contactsInSection[indexPath.row];
    
    // 根据联系人姓名配置单元格
    cell.textLabel.text = contactName;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.indexTitles[section];
}

- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return self.indexTitles;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    return [self.indexTitles indexOfObject:title];
}


@end
