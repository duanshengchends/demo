//
//  ViewController.m
//  demo
//
//  Created by 段昇辰 on 2017/8/24.
//  Copyright © 2017年 www.coolketang.com. All rights reserved.
//

#import "ViewController.h"
#import "myModel.h"
#import "af"
#import "MyTableViewCell.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic)UITableView *tableView;
@property (strong, nonatomic)NSMutableArray <myModel *>* modelArray;

@end

@implementation ViewController

//懒加载
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.modelArray = [NSMutableArray array];
    [self.view addSubview:self.tableView];
    [self getData];
}

- (MyTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MyTableViewCell" owner:nil options:nil] lastObject];
    }
    myModel *model = self.modelArray[indexPath.row];
    //    cell.myImageView.image = [uii]
    NSString *urlStr = model.images[@"large"];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSData *data = [NSData dataWithContentsOfURL:url];
    cell.myImageView.image = [UIImage imageWithData:data];
    cell.titleLabel.text = model.title;
    cell.year.text = model.year;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.modelArray.count;
}

- (void)getData {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSString *url = @"http://api.douban.com/v2/movie/top250";
    
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", responseObject);
        NSArray *dataArray = responseObject[@"subjects"];
        for (NSDictionary *dic in dataArray) {
            myModel *model = [[myModel alloc]initWithDic:dic];
            [self.modelArray addObject:model];
        }
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error :%@", error);
    }];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 300;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
