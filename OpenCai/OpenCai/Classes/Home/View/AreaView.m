//
//  AreaView.m
//  OpenCai
//
//  Created by 谈虎啸 on 2017/1/22.
//  Copyright © 2017年 谈虎啸. All rights reserved.
//

#import "AreaView.h"

@implementation AreaView

+ (instancetype)loadAreaView {
    return [[NSBundle mainBundle] loadNibNamed:@"AreaView" owner:nil options:nil].firstObject;
}


@end
