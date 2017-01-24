//
//  AreaView.m
//  OpenCai
//
//  Created by 谈虎啸 on 2017/1/22.
//  Copyright © 2017年 谈虎啸. All rights reserved.
//

#import "AreaView.h"
#import "ProModel.h"
#import "TriangleView.h"
#define CellReuseIdentifier (@"CellReuseIdentifier")

@interface AreaView()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) UIImageView *areaImageView;    //图片
@property (weak, nonatomic) UITableView *areaListView;     //列表
@property (strong, nonatomic) NSMutableArray *dataSoure;
@property (weak, nonatomic) TriangleView *markView;                 //滑块

@property (assign, nonatomic) NSInteger lastIndex;                  //上一个cell
@end

@implementation AreaView
//懒加载
- (NSArray *)dataSoure {
    if (!_dataSoure) {
        _dataSoure = [NSMutableArray new];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"ProvinceList" ofType:@"plist"];
     
        NSArray *array = [[NSArray alloc]initWithContentsOfFile:path];

        for (NSDictionary *dict in array) {
            ProModel *proModel = [ProModel modelFromDic:dict];
        
            [_dataSoure addObject:proModel];
         
        }

    }
    
    return _dataSoure;
}


//初始化
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        _lastIndex = 0;
        
        [self setupUI];
    }
    return self;
}
- (void)setupUI {
    
    //1.左边图片
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width * 2 / 3, self.bounds.size.height)];
    imageView.image = [UIImage imageNamed:@"areaIcon"];
    [self addSubview:imageView];
    _areaImageView = imageView;
    
    //2.右边列表
    UITableView *listView = [[UITableView alloc]initWithFrame:CGRectMake(self.bounds.size.width * 2 / 3, 0, self.bounds.size.width * 1 / 3, self.bounds.size.height)];
    listView.dataSource = self;
    listView.delegate = self;
    listView.scrollEnabled = NO;
    listView.rowHeight = listView.bounds.size.height / self.dataSoure.count;  //行高
    [listView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellReuseIdentifier];
    [self addSubview:listView];
    _areaListView = listView;
    

    //3.添加滑块
    CGFloat H = _areaListView.rowHeight;
    CGFloat W = H * 1 / 4;
    CGFloat X = _areaImageView.bounds.size.width - W;
    CGFloat Y = 0;
    
    TriangleView *markView = [[TriangleView alloc]initWithFrame:CGRectMake(X, Y, W, H)];
    markView.backgroundColor = [UIColor clearColor];
    [_areaImageView addSubview:markView];
    _markView = markView;
}

#pragma mark - UITableViewDelegate && UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataSoure.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellReuseIdentifier];
    ProModel *model = self.dataSoure[indexPath.row];
    
    cell.textLabel.text = model.name;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    
   
    //移动滑块
    NSInteger currentIndex = indexPath.row;
    //NSLog(@"current = %d", currentIndex);
    NSInteger value = currentIndex - _lastIndex;        //两个cell之间的差值
  
    CGRect originalFrame = _markView.frame;
    originalFrame.origin.y = originalFrame.origin.y + (originalFrame.size.height * value);
    CGRect newFrame = CGRectMake(originalFrame.origin.x, originalFrame.origin.y, originalFrame.size.width, originalFrame.size.height);
    
    //注意：这里一定等block执行完毕再能让方法结束，否则当cell点击过快的时候，block还没来得及执行方法就结束了，会造成下标混乱
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);  //创建一个信号
    [UIView animateWithDuration:0.2 animations:^{
        
        _markView.frame = newFrame;
        _lastIndex = currentIndex;                      //更新下标
         dispatch_semaphore_signal(semaphore);          //发出信号
    } completion:^(BOOL finished) {
       
    }];
    
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);      //等待执行（收到信号才会执行）
    
}


-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    _lastIndex = indexPath.row;
    
    //NSLog(@"last = %d", _lastIndex);
}
@end
