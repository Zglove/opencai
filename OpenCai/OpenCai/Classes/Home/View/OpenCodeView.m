//
//  OpenCodeView.m
//  OpenCai
//
//  Created by 谈虎啸 on 2017/1/22.
//  Copyright © 2017年 谈虎啸. All rights reserved.
//

#import "OpenCodeView.h"

@implementation OpenCodeView


+ (instancetype)loadOpenCodeView {
    return [[NSBundle mainBundle] loadNibNamed:@"OpenCodeView" owner:nil options:nil].firstObject;
}



@end
