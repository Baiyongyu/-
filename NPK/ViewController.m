//
//  ViewController.m
//  NPK
//
//  Created by 宇玄丶 on 2017/3/27.
//  Copyright © 2017年 北京116工作室. All rights reserved.
//

#import "ViewController.h"
#import "NPKScopeView.h"

#define SCREEN_WIDTH     [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT    [UIScreen mainScreen].bounds.size.height
@interface ViewController ()
@property(nonatomic,strong)NSArray *indicatorArr1;
@property(nonatomic,strong)NSArray *indicatorArr2;
@property(nonatomic,strong)NSArray *indicatorArr3;
@property(nonatomic,strong)NPKScopeView *npkScopeView1;
@property(nonatomic,strong)NPKScopeView *npkScopeView2;
@property(nonatomic,strong)NPKScopeView *npkScopeView3;
@property(nonatomic,copy)NSString *npkScope1;
@property(nonatomic,copy)NSString *npkScope2;
@property(nonatomic,copy)NSString *npkScope3;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    
    _npkScopeView1 = [[NPKScopeView alloc] initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, 100) indicatorValue:self.indicatorArr1 npkScope:self.npkScope1 npkNameLabel:@"氮"];
    [self.view addSubview:_npkScopeView1];
    
    _npkScopeView2 = [[NPKScopeView alloc] initWithFrame:CGRectMake(0, 160, SCREEN_WIDTH, 100) indicatorValue:self.indicatorArr2 npkScope:self.npkScope2 npkNameLabel:@"磷"];
    [self.view addSubview:_npkScopeView2];
    
    _npkScopeView3 = [[NPKScopeView alloc] initWithFrame:CGRectMake(0, 220, SCREEN_WIDTH, 100) indicatorValue:self.indicatorArr3 npkScope:self.npkScope3 npkNameLabel:@"钾"];
    [self.view addSubview:_npkScopeView3];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)initData{
    NSString *n_scope = @"0,80,100,200,999";
    self.indicatorArr1 = [n_scope componentsSeparatedByString:@","];
    self.indicatorArr2 = [n_scope componentsSeparatedByString:@","];
    self.indicatorArr3 = [n_scope componentsSeparatedByString:@","];
    self.npkScope1 = @"10.05";
    self.npkScope2 = @"120.27";
    self.npkScope3 = @"500.93";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
