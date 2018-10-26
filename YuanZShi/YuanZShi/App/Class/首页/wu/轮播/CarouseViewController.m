//
//  CarouseViewController.m
//  无限轮播
//
//  Created by 马旭东 on 2018/9/4.
//  Copyright © 2018年 马旭东. All rights reserved.
//

#import "CarouseViewController.h"
#import "CarouseView.h"
@interface CarouseViewController ()
{
    
    CarouseView *carouseView;
    NSArray *kvDataArray;
}


@end

@implementation CarouseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // 初始化一些数据
    kvDataArray = @[@"page 1", @"page 2", @"page3"];
    
    
    
    carouseView = [[CarouseView alloc] initWithFrame:CGRectMake(15, 50, self.view.frame.size.width-30, 200)];
    [self setupCarouseView];
    [self.view addSubview:carouseView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - 轮播图设置
- (void)setupCarouseView
{
    // 图片数组，可以是其他的资源，设置到轮播图上就可以
    NSMutableArray *imagerray = [NSMutableArray array];
    for (int i = 0; i < kvDataArray.count; i++)
    {
        // 先用空白页测试
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg", i + 1]];
        [imagerray addObject:image];
    }
    
    [carouseView setupSubviewPages:imagerray withCallbackBlock:^(NSInteger pageIndex) {

    }];
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
