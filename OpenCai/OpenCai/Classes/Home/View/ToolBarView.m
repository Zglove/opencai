//
//  ToolBarView.m
//  OpenCai
//
//  Created by 谈虎啸 on 2017/1/24.
//  Copyright © 2017年 谈虎啸. All rights reserved.
//

#import "ToolBarView.h"

@interface ToolBarView ()

@property (weak, nonatomic) UIButton *helpBtn;      //帮助
@property (weak, nonatomic) UIButton *setBtn;       //设置

@end

@implementation ToolBarView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.backgroundColor = [UIColor redColor];
}
@end
