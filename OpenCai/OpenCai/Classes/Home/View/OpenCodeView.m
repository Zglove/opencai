//
//  OpenCodeView.m
//  OpenCai
//
//  Created by 谈虎啸 on 2017/1/22.
//  Copyright © 2017年 谈虎啸. All rights reserved.
//

#import "OpenCodeView.h"

@interface OpenCodeView()

@property (weak, nonatomic) UILabel *titleLabel;        //标题
@property (strong, nonatomic) NSMutableArray *dataSource;

@end

@implementation OpenCodeView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        _dataSource = [NSMutableArray arrayWithArray:@[@"8", @"5", @"3", @"6", @"2"]];
        
        
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    //1.标题
    UILabel *titleLabel = [UILabel createLabelWithFrame:CGRectMake(0, 0, self.bounds.size.width, 30) text:@"第46期最新开奖号码" textFontSize:14 textColor:[UIColor blackColor] textAlignment:NSTextAlignmentCenter];
    [self addSubview:titleLabel];
    _titleLabel = titleLabel;
    
    //2.开奖码
    
    int totalCount = 5;     //总个数
    CGFloat margin = 10;
    CGFloat W = 40;
    CGFloat H = W;
    CGFloat Y = _titleLabel.bounds.size.height;
    CGFloat border = (k_SCREEN_W - (totalCount * W + (totalCount - 1) * margin)) * 0.5;
    for (int i = 0; i < totalCount; i++) {
        CGFloat X = border + i * (W + margin);
        
        UILabel *label = [UILabel createLabelWithFrame:CGRectMake(X, Y, W, H) text:_dataSource[i] textFontSize:20 textColor:[UIColor whiteColor] textAlignment:NSTextAlignmentCenter];
        label.backgroundColor = [UIColor redColor];
        label.layer.cornerRadius = W * 0.5;
        label.layer.masksToBounds = YES;
        [self addSubview:label];
        
    }
}

@end
