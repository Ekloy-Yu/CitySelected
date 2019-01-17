//
//  ViewController.m
//  城市选择器
//
//  Created by 卢华 on 2019/1/14.
//  Copyright © 2019年 于天琦. All rights reserved.
//

#import "ViewController.h"
#import "AreaSelectViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *cityName;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _cityName = [[UIButton buttonWithType:UIButtonTypeCustom] initWithFrame:CGRectMake(100, 100, 200, 50)];
    _cityName.backgroundColor = [UIColor redColor];
    [_cityName addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_cityName];
    
}
- (void)clickBtn {
    
    AreaSelectViewController *ctrl = [[AreaSelectViewController alloc] init];
    [self.navigationController pushViewController:ctrl animated:YES];
    __weak AreaSelectViewController *_ctrl = ctrl;
    [ctrl setSelectedCityBlock:^(AreaModel * info) {
        //获取城市名字
        [self.cityName setTitle:info.areaName forState:UIControlStateNormal];
        
        [_ctrl.navigationController popViewControllerAnimated:YES];
    }];
}

@end
