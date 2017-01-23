//
//  ProModel.h
//  OpenCai
//
//  Created by 谈虎啸 on 2017/1/23.
//  Copyright © 2017年 谈虎啸. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LotteryModel : NSObject
@property (copy, nonatomic) NSString *name;         //彩票名称
@property (copy, nonatomic) NSString *code;         //彩票代码
@property (assign, nonatomic) BOOL isHot;           //是否高频

+ (instancetype)modelFromDic:(NSDictionary *)dict;
@end

@interface ProModel : NSObject
@property (copy, nonatomic) NSString *name;         //地区名称
@property (strong, nonatomic) NSMutableArray *data;        //彩票数组

+ (instancetype)modelFromDic:(NSDictionary *)dict;
@end
