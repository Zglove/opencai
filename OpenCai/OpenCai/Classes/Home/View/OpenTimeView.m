//
//  OpenTimeView.m
//  OpenCai
//
//  Created by 谈虎啸 on 2017/1/24.
//  Copyright © 2017年 谈虎啸. All rights reserved.
//

#import "OpenTimeView.h"

@interface OpenTimeView ()
@property (weak, nonatomic) UILabel *titleLabel;        //标题
@property (weak, nonatomic) UILabel *firstNum;
@property (weak, nonatomic) UILabel *secondNum;
@property (weak, nonatomic) UILabel *thirdNum;
@property (weak, nonatomic) UILabel *fourthNum;
@property (weak, nonatomic) UILabel *colon;             //冒号

@property (weak, nonatomic) UIView *topLine;                //上边线
@property (weak, nonatomic) UIView *buttomLine;             //下边线
@end
@implementation OpenTimeView


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        
        
        
        [self setupUI];
    }
    return self;
}
- (void)setupUI {
    
    self.backgroundColor = k_RGB(248, 247, 233);
    
    //1.标题
    UILabel *titleLabel = [UILabel createLabelWithFrame:CGRectMake(0, 0, self.bounds.size.width * 0.5, self.bounds.size.height) text:@"第47期开奖时间剩余：" textFontSize:14 textColor:[UIColor blackColor] textAlignment:NSTextAlignmentCenter];
    [self addSubview:titleLabel];
    _titleLabel = titleLabel;
    
    //2.倒计时
    CGFloat border = 8;
    CGFloat margin = 5;
    CGFloat H = self.bounds.size.height - 2 * border;
    CGFloat W = H * 0.5;
    CGFloat Y = border;
    UIColor *color = k_RGB(0, 0, 123);
    
    UILabel *fir = [UILabel createLabelWithFrame:CGRectMake(self.bounds.size.width * 0.5, Y, W, H) text:@"1" textFontSize:18 textColor:color textAlignment:NSTextAlignmentCenter];
    fir.backgroundColor = [UIColor whiteColor];
    fir.layer.borderWidth = 1;
    fir.layer.borderColor = k_RGB(148, 173, 192).CGColor;
    [self addSubview:fir];
    _firstNum = fir;
    
    UILabel *sec = [UILabel createLabelWithFrame:CGRectMake(_firstNum.frame.origin.x + _firstNum.frame.size.width + margin, Y, W, H) text:@"1" textFontSize:18 textColor:color textAlignment:NSTextAlignmentCenter];
    sec.backgroundColor = [UIColor whiteColor];
    sec.layer.borderWidth = 1;
    sec.layer.borderColor = k_RGB(148, 173, 192).CGColor;
    [self addSubview:sec];
    _secondNum = sec;
    
    UILabel *col = [UILabel createLabelWithFrame:CGRectMake(_secondNum.frame.origin.x + _secondNum.frame.size.width, Y, W * 2, H) text:@":" textFontSize:18 textColor:color textAlignment:NSTextAlignmentCenter];
    [self addSubview:col];
    _colon = col;
    
    UILabel *thi = [UILabel createLabelWithFrame:CGRectMake(_colon.frame.origin.x + _colon.frame.size.width, Y, W, H) text:@"2" textFontSize:18 textColor:color textAlignment:NSTextAlignmentCenter];
    thi.backgroundColor = [UIColor whiteColor];
    thi.layer.borderWidth = 1;
    thi.layer.borderColor = k_RGB(148, 173, 192).CGColor;
    [self addSubview:thi];
    _thirdNum = thi;
    
    UILabel *fou = [UILabel createLabelWithFrame:CGRectMake(_thirdNum.frame.origin.x + _thirdNum.frame.size.width + margin, Y, W, H) text:@"8" textFontSize:18 textColor:color textAlignment:NSTextAlignmentCenter];
    fou.backgroundColor = [UIColor whiteColor];
    fou.layer.borderWidth = 1;
    fou.layer.borderColor = k_RGB(148, 173, 192).CGColor;
    [self addSubview:fou];
    _fourthNum = fou;
    
    //3.上下边线
    CGFloat length = 1;
    UIView *topLine = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, length)];
    topLine.backgroundColor = k_RGB(253, 219, 139);
    [self addSubview:topLine];
    _topLine = topLine;
    
    UIView *buttomLine = [[UIView alloc]initWithFrame:CGRectMake(0, self.bounds.size.height - length, self.bounds.size.width, length)];
    buttomLine.backgroundColor = k_RGB(253, 219, 139);
    [self addSubview:buttomLine];
    _buttomLine = buttomLine;
}
@end
