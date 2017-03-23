//
//  ViewController.m
//  MarqueeView
//
//  Created by fanxiaobin on 2017/3/23.
//  Copyright © 2017年 fanxiaobin. All rights reserved.
//

#import "ViewController.h"
#import "WQLPaoMaView.h"
#import "GYChangeTextView.h"


@interface ViewController () <GYChangeTextViewDelegate>

@property (nonatomic, strong) GYChangeTextView *tView;
@property (nonatomic, strong) WQLPaoMaView *paoma;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self leftScroll];
    
    [self upAndDownScroll];
   
}

#pragma mark --- 左右跑马
- (void)leftScroll{
    
    _paoma = [[WQLPaoMaView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 50) withTitle:@"全场卖两块，买啥都两块，两块钱，你买不了吃亏，两块钱，你买不了上当，真正的物有所值。拿啥啥便宜 买啥啥不贵，都两块，买啥都两块，全场卖两块，随便挑，随便选，都两块～～ "];
    [self.view addSubview:_paoma];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake((self.view.frame.size.width-100)/2, 200, 100, 50);
    [button addTarget:self action:@selector(stopPaoma:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"停止" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:button];
    
    
    UIButton *buttona = [UIButton buttonWithType:UIButtonTypeCustom];
    buttona.frame = CGRectMake((self.view.frame.size.width-100)/2, 300, 100, 50);
    [buttona addTarget:self action:@selector(startPaoMa:) forControlEvents:UIControlEventTouchUpInside];
    [buttona setTitle:@"开始" forState:UIControlStateNormal];
    [buttona setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:buttona];
    
}

- (void)stopPaoma:(UIButton*)sender
{
    [_paoma stop];
}

- (void)startPaoMa:(UIButton*)sender
{
    [_paoma start];
}


#pragma mark --- 上下翻动
- (void)upAndDownScroll{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(100, 500, 80, 30)];
    [button setTitle:@"stop" forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button setBackgroundColor:[UIColor blackColor]];
    [button addTarget:self action:@selector(stop) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setFrame:CGRectMake(220, 500, 80, 30)];
    [button1 setTitle:@"start" forState:UIControlStateNormal];
    [self.view addSubview:button1];
    [button1 setBackgroundColor:[UIColor blackColor]];
    [button1 addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
    
    GYChangeTextView *tView = [[GYChangeTextView alloc] initWithFrame:CGRectMake(100, 400, 200, 40)];
    tView.delegate = self;
    tView.layer.borderWidth = 1.0;  /*为了看的清楚加个边*/
    tView.layer.borderColor = [UIColor blackColor].CGColor;
    [self.view addSubview:tView];
    self.tView = tView;
    [self.tView animationWithTexts:[NSArray arrayWithObjects:@"这是第1条",@"这是第2条",@"这是第3条", nil]];
}

- (void)start{
    [_tView reloadAniation];
}

- (void)stop {
    [_tView stopAnimation];
}

- (void)gyChangeTextView:(GYChangeTextView *)textView didTapedAtIndex:(NSInteger)index {
    NSLog(@"%ld",index);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
