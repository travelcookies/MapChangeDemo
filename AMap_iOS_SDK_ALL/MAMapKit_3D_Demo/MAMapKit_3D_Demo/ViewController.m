//
//  ViewController.m
//  MAMapKit_3D_Demo
//
//  Created by 翁乐 on 8/9/16.
//  Copyright © 2016 Autonavi. All rights reserved.
//

#import "ViewController.h"
#define MainViewControllerTitle @"高德地图API-3D"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    UITableView * _mainTableView;
    NSArray     * _titles;
    NSArray     * _detailTitles;
    NSArray     * _className;
}

@end

@implementation ViewController


#pragma mark - tableView delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *className = _className[indexPath.section];
    
    UIViewController *subViewController = [[NSClassFromString(className) alloc] init];
    subViewController.title = _titles[indexPath.section];
    
    [self.navigationController pushViewController:subViewController animated:YES];
}

#pragma mark - tableView DataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_titles count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 75;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *mainCellIdentifier = @"com.autonavi.mainCellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:mainCellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:mainCellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.detailTextLabel.lineBreakMode = NSLineBreakByCharWrapping;
        cell.detailTextLabel.numberOfLines = 0;
    }
    
    cell.textLabel.text = _titles[indexPath.section];
    
    cell.detailTextLabel.text = _detailTitles[indexPath.section];
    
    return cell;
}


#pragma mark - init
- (void)initTitles
{
    ///主页面标签title
    _titles = @[@"创建地图",
                @"与地图交互",
                @"点标注和定位点",
                @"在地图上绘制覆盖物",
                @"获取地图数据",
                @"出行路线规划",
                @"地图计算工具",
                @"短串分享",
                @"周边搜索",
                @"离线地图",
                @"轨迹纠偏",
                @"自定义地图样式"
                ];
}

- (void)initDetalTitles
{
    ///标签描述
    _detailTitles = @[@"地图类型切换、多实例地图",
                      @"图层展示、控件交互、手势交互、方法交互以及地图截屏",
                      @"点标注，自定义点标注，自定义定位点，定位箭头旋转",
                      @"绘制线、多边形、圆、OpenGl、热力图",
                      @"获取POI、地址描述、行政区边界、公交以及自有的数据",
                      @"驾车、步行、骑行、公交路线规划",
                      @"坐标转换、距离计算",
                      @"位置、路径规划、POI和导航分享",
                      @"上传位置信息并且可以检索(NearbyVewController)",
                      @"离线地图的下载、更新、删除(OfflineViewController)",
                      @"传入原始轨迹经纬度点，获取纠偏后的轨迹(MATraceCorrectViewController)",
                      @"自定义地图样式，如道路、陆地、建筑物颜色(CustomMapStyleViewController)"
                      ];
}

- (void)initClassName
{
    ///标签目标类
    _className = @[@"AMEntrySelect1Controller",
                   @"AMEntrySelect2Controller",
                   @"AMEntrySelect3Controller",
                   @"AMEntrySelect3_1Controller",
                   @"AMEntrySelect4Controller",
                   @"AMEntrySelect5Controller",
                   @"AMEntrySelect6Controller",
                   @"AMEntrySelect7Controller",
                   @"NearbyVewController",
                   @"OfflineViewController",
                   @"MATraceCorrectViewController",
                   @"CustomMapStyleViewController"
                   ];
}

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = MainViewControllerTitle;
    
    [self initTitles];
    [self initDetalTitles];
    [self initClassName];
    
    _mainTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _mainTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    _mainTableView.sectionHeaderHeight = 10;
    _mainTableView.sectionFooterHeight = 0;
    _mainTableView.delegate = self;
    _mainTableView.dataSource = self;
    
    [self.view addSubview:_mainTableView];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBar.translucent = NO;
    
    [self.navigationController setToolbarHidden:YES animated:animated];
}

@end
