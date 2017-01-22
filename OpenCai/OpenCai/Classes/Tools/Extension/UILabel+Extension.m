//
//  UILabel+Extension.m
//  OpenCai
//
//  Created by 谈虎啸 on 2017/1/22.
//  Copyright © 2017年 谈虎啸. All rights reserved.
//

#import "UILabel+Extension.h"

@implementation UILabel (Extension)

+ (instancetype)createLabelWithFrame:(CGRect)frame text:(NSString *)text textFontSize:(CGFloat)textFontSize textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment {
    
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    [label setText:text];
    [label setTextColor:textColor];
    label.textAlignment = textAlignment;
    [label setFont:[UIFont systemFontOfSize:textFontSize]];
    return label;
}

@end
