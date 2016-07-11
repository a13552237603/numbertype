//
//  SearchViewController.m
//  数字键盘
//
//  Created by 贺恒涛 on 16/6/23.
//  Copyright © 2016年 贺恒涛. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchViewCell.h"
#import "HotSearchCollectionViewCell.h"
#define HEX_COLOR(x_RGB) [UIColor colorWithRed:((float)((x_RGB & 0xFF0000) >> 16))/255.0 green:((float)((x_RGB & 0xFF00) >> 8))/255.0 blue:((float)(x_RGB & 0xFF))/255.0 alpha:1.0f]
@interface SearchViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *SearchTableView;//搜索的记录
@property (nonatomic, strong) NSMutableArray *dataArr;
@property (nonatomic, strong) NSMutableArray *HotDataArr;
@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSArray *array = @[@"鞋子",@"全球时尚",@"天天搞机",@"苏宁易购",@"好",@"热门推荐内容",@"猜你喜欢"];
    self.HotDataArr = [[NSMutableArray alloc]init];
    self.HotDataArr = [[NSMutableArray alloc]initWithObjects:@"鞋子",@"全球时尚",@"天天搞机",@"苏宁易购",@"好",@"热门推荐内容",@"猜你喜欢", nil];
    _SearchTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _SearchTableView.delegate = self;
    _SearchTableView.dataSource = self;
    [self.view addSubview:_SearchTableView];
    _SearchTableView.backgroundColor = [UIColor blackColor];
    _SearchTableView.userInteractionEnabled = YES;

    // Do any additional setup after loading the view from its nib.
}


#pragma mark - tableView的代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
     return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"SearchViewCell";
      SearchViewCell*cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil)
    {
        cell = [[SearchViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    if (self.HotDataArr.count !=0) {
        [cell infortdataArr:self.HotDataArr ];
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 300;
}
- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
