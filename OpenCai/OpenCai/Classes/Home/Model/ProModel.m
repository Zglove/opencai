//
//  ProModel.m
//  OpenCai
//
//  Created by 谈虎啸 on 2017/1/23.
//  Copyright © 2017年 谈虎啸. All rights reserved.
//

#import "ProModel.h"

#pragma mark - 彩票模型
NSString *const kLotteryName = @"name";
NSString *const kLotteryCode = @"code";
NSString *const kLotteryHot = @"isHot";

@interface LotteryModel()

@end

@implementation LotteryModel

+ (instancetype)modelFromDic:(NSDictionary *)dict {
    NSString *name = dict[kLotteryName];
    NSString *code = dict[kLotteryCode];
    BOOL isHot = dict[kLotteryHot];
    
    LotteryModel *model = [[LotteryModel alloc]init];
    model.name = name ? name : @"";
    model.code = code ? code : @"";
    model.isHot = isHot ? isHot : NO;
    
    return model;
}
@end

#pragma mark - 省份模型
NSString *const kProName = @"name";
NSString *const kProData = @"data";
@interface ProModel()

@end
@implementation ProModel
-(NSMutableArray *)data {
    if (!_data) {
        _data = [NSMutableArray new];
    }
    return _data;
}
+ (instancetype)modelFromDic:(NSDictionary *)dict {
    
    ProModel *proModel = [[ProModel alloc]init];
    
    NSString *name = dict[kProName];
    proModel.name = name ? name : @"";
    NSArray *array = dict[kProData];

    for (NSDictionary *dict in array) {
        LotteryModel *lotteryModel = [LotteryModel modelFromDic:dict];
        [proModel.data addObject:lotteryModel];
    }
//    NSLog(@"%@", proModel.data);
    return proModel;
}

@end
