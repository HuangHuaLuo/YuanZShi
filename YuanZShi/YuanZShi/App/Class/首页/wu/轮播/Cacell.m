//
//  Cacell.m
//  YuanZShi
//
//  Created by 疏影浮生 on 2018/10/8.
//  Copyright © 2018年 YixinJinansunreading. All rights reserved.
//

#import "Cacell.h"


@interface Cacell ()<UITableViewDelegate,UITableViewDataSource>
{
    
    CarouseView *carouseView;
    NSArray *kvDataArray;
}

@end

@implementation Cacell

- (void)awakeFromNib{
    [super awakeFromNib];
    
    self.backgroundColor = [UIColor whiteColor];
    // 初始化一些数据
    kvDataArray = @[@"page 1", @"page 2", @"page3"];
    carouseView = [[CarouseView alloc] initWithFrame:CGRectMake(15, 0, self.frame.size.width-30, 200)];
    [self setupCarouseView];
    [self addSubview:carouseView];
    
}

#pragma mark - Table view data source


//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
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
+(instancetype)cellInit:(UITableView *)tableView
{
    static NSString *identifier = @"cell2";
    Cacell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    return cell;
}


@end
