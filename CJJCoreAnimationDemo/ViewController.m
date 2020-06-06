//
//  ViewController.m
//  CJJCoreAnimationDemo
//
//  Created by JimmyCJJ on 2020/6/6.
//  Copyright © 2020 CAOJIANJIN. All rights reserved.
//

#import "ViewController.h"
#import "AnimationVC.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,copy) NSArray *dataArr;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UIImageView *animationImg;
@end

@implementation ViewController

- (NSArray *)dataArr
{
    if(!_dataArr)
    {
        _dataArr = @[
            @{@"sec":@"Basic基本动画",@"types":@[@"自转动画"],@"CJJAnimationType":@(CJJAnimationType_Basic)},
            @{@"sec":@"Key关键帧动画",@"types":@[@"关键帧动画"],@"CJJAnimationType":@(CJJAnimationType_Key)},
            @{@"sec":@"Spring弹簧动画",@"types":@[@"弹簧动画"],@"CJJAnimationType":@(CJJAnimationType_Spring)},
            @{@"sec":@"Transition转场动画",@"types":@[@"转场动画"],@"CJJAnimationType":@(CJJAnimationType_Transition)},
            @{@"sec":@"Group动画组动画",@"types":@[@"动画组动画"],@"CJJAnimationType":@(CJJAnimationType_Group)}
        ];
    }
    return _dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"动画demo";
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *secDic = self.dataArr[indexPath.section];
    NSArray *typesArr = secDic[@"types"];
    NSLog(@"点击了%@---%@",typesArr[indexPath.row],indexPath);

    CJJAnimationType type = [NSString stringWithFormat:@"%@",secDic[@"CJJAnimationType"]].integerValue;
    AnimationVC *vc = [[AnimationVC alloc] initWithType:type];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSDictionary *secDic = self.dataArr[section];
    NSArray *typesArr = secDic[@"types"];
    return typesArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSDictionary *secDic = self.dataArr[section];
    
    UIView *view = [[UIView alloc] init];
    UILabel *label = [UILabel new];
    label.text = secDic[@"sec"];
    [view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(view);
    }];
    
    return view;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [UIView new];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    NSDictionary *secDic = self.dataArr[indexPath.section];
    NSArray *typesArr = secDic[@"types"];
    cell.textLabel.text = typesArr[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (UITableView *)tableView
{
    if(!_tableView)
    {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor whiteColor];
    }
    return _tableView;
}
@end

