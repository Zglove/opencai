//
//  HomeViewController.m
//  OpenCai
//
//  Created by 谈虎啸 on 2017/1/22.
//  Copyright © 2017年 谈虎啸. All rights reserved.
//

#import "HomeViewController.h"
#import "OpenCodeView.h"
#import "AreaView.h"
#import "CardView.h"

@interface HomeViewController ()
//父视图，用来包裹自定义视图
@property (weak, nonatomic) IBOutlet UIView *codeSuperView;
@property(nonatomic, weak) OpenCodeView *codeView;

@property (weak, nonatomic) IBOutlet UIView *areaSuperView;
@property(nonatomic, weak) AreaView *areaView;

@property (weak, nonatomic) IBOutlet UIView *cardSuperView;
@property(nonatomic, weak) CardView *cardView;

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
    _codeView = [OpenCodeView loadOpenCodeView];
    _codeView.frame = _codeSuperView.bounds;
    [_codeSuperView addSubview:_codeView];
    
    _areaView = [AreaView loadAreaView];
    _areaView.frame = _areaSuperView.bounds;
    [_areaSuperView addSubview:_areaView];
}
#pragma mark - 监听事件
- (void)shareItemClicked:(id)sender {
    NSLog(@"shareItemClicked");
}
- (void)loginBtnClicked:(id)sender {
    NSLog(@"loginBtnClicked");
}
@end
