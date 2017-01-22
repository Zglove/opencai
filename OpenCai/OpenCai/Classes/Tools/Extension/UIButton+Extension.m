//
//  UIButton+UIButton_Extension.m
//  OpenCai
//
//  Created by 谈虎啸 on 2017/1/22.
//  Copyright © 2017年 谈虎啸. All rights reserved.
//

#import "UIButton+Extension.h"

@implementation UIButton (Extension)

+ (instancetype)createButtonWithFrame:(CGRect)frame title:(NSString *)title imageName:(NSString *)imageName titleColor:(UIColor *)titleColor titleFontSize:(CGFloat)titleFontSize target:(id)target action:(SEL)action {
    
    UIButton *btn = [[UIButton alloc]initWithFrame:frame];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:titleFontSize]];
    return btn;
}

@end
