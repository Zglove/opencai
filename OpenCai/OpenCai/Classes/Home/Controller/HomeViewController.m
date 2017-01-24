//
//  HomeViewController.m
//  OpenCai
//
//  Created by 谈虎啸 on 2017/1/22.
//  Copyright © 2017年 谈虎啸. All rights reserved.
//

#import "HomeViewController.h"
#import "OpenCodeView.h"
#import "OpenTimeView.h"
#import "AreaView.h"
#import "CardView.h"
#import "ToolBarView.h"

@interface HomeViewController ()

@property(nonatomic, weak) OpenCodeView *codeView;
@property(nonatomic, weak) OpenTimeView *timeView;
@property(nonatomic, weak) AreaView *areaView;
@property(nonatomic, weak) CardView *cardView;
@property(nonatomic, weak) ToolBarView *toolView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
   
    [self setupUI];
}

- (void)setupUI {
    //1.设置导航栏
    UIImage *shareImg = [[UIImage imageNamed:@"shareIcon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *shareItem = [[UIBarButtonItem alloc]initWithImage:shareImg style:UIBarButtonItemStylePlain target:self action:@selector(shareItemClicked:)];
    shareItem.imageInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    self.navigationItem.leftBarButtonItem = shareItem;
    
    UIButton *loginBtn = [UIButton createButtonWithFrame:CGRectMake(0, 0, 80, 40) title:@"登录" imageName:@"loginIcon" titleColor:[UIColor whiteColor] titleFontSize:14 target:self action:@selector(loginBtnClicked:)];
    loginBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -40);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:loginBtn];
    
    UILabel *titleLabel = [UILabel createLabelWithFrame:CGRectMake(0, 0, 80, 40) text:@"时时彩" textFontSize:16 textColor:[UIColor whiteColor] textAlignment:NSTextAlignmentCenter];
    self.navigationItem.titleView = titleLabel;
    
    //2.设置界面
    OpenCodeView *cv = [[OpenCodeView alloc]initWithFrame:CGRectMake(0, 0, k_SCREEN_W, 80)];
    [self.view addSubview:cv];
    _codeView = cv;
    
    OpenTimeView *tv = [[OpenTimeView alloc]initWithFrame:CGRectMake(0, _codeView.bounds.size.height, k_SCREEN_W, 50)];
    [self.view addSubview:tv];
    _timeView = tv;
    
    AreaView *av = [[AreaView alloc]initWithFrame:CGRectMake(0, _timeView.frame.origin.y + _timeView.frame.size.height, k_SCREEN_W, 140)];
    [self.view addSubview:av];
    _areaView = av;
    
    CardView *dv = [[CardView alloc]initWithFrame:CGRectMake(0, _areaView.frame.origin.y + _areaView.frame.size.height, k_SCREEN_W, 100)];
    dv.frame = CGRectMake(0, _areaView.frame.origin.y + _areaView.frame.size.height, k_SCREEN_W, [dv getH]);
    
    [self.view addSubview:dv];
    _cardView = dv;
    
    //3.设置底部条
    NSLog(@"%@", NSStringFromCGRect(self.view.frame));
    //有导航的情况下，view会被整体下移64，有64高部分在屏幕外面
    ToolBarView *toolView = [[ToolBarView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height - 44 - 64, k_SCREEN_W, 44)];
    [self.view addSubview:toolView];
    _toolView = toolView;
    
}
#pragma mark - 监听事件
- (void)shareItemClicked:(id)sender {
    NSLog(@"shareItemClicked");
}
- (void)loginBtnClicked:(id)sender {
    NSLog(@"loginBtnClicked");
}
@end
