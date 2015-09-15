//
//  ViewController.m
//  TestProgressUI
//
//  Created by JC_CP3 on 15/9/14.
//  Copyright (c) 2015年 JC_CP3. All rights reserved.
//

#import "ViewController.h"
#define M_PI   3.14159265358979323846264338327950288

@interface ViewController ()
{
    NSMutableArray *blueArray;
    NSTimer *timer;
}

@end

@implementation ViewController

- (void)loadView
{
    self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UIProgressView *view = [[UIProgressView alloc] initWithFrame:CGRectMake(100, 100, 100, 20)];
//    view.progress = 0.3;
//    [self.view addSubview:view];
    
//    CGAffineTransform transform = view.transform;
//    transform = CGAffineTransformRotate(transform, (M_PI/2)*3);
//    view.transform = transform;
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(getRandomNum) userInfo:nil repeats:YES];
    
    for (int i = 0; i < 20; i++) {
        UIView *progressView = [[UIView alloc] initWithFrame:CGRectMake(i*10+(i+1)*10, 100, 2, 100)];
        progressView.backgroundColor = [UIColor lightGrayColor];
        [self.view addSubview:progressView];
    }

}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [timer invalidate];
    timer = nil;
}

- (void)getRandomNum
{
    blueArray = [[NSMutableArray alloc] init];
    for(int i = 0; i < 20; i++) {
        int j = arc4random() % 100;
        [blueArray addObject:[NSNumber numberWithInt:j]];
    }
    [self updateProgressView];
}

- (void)updateProgressView
{
    for (int j = 0; j < 20; j++) {
        if ([self.view viewWithTag:j+1]) {
            UIView *blueProgressView = [self.view viewWithTag:j+1];
            [UIView animateWithDuration:.5 animations:^{
                blueProgressView.frame = CGRectMake(j*10+(j+1)*10, 100 + [blueArray[j] intValue], 2, 100 - [blueArray[j] intValue]);
            }];
        } else {
            UIView *blueProgressView = [[UIView alloc] initWithFrame:CGRectMake(j*10+(j+1)*10, 100 + [blueArray[j] intValue], 2, 100 - [blueArray[j] intValue])];
            blueProgressView.tag = j + 1;
            blueProgressView.backgroundColor = [UIColor blueColor];
            [self.view addSubview:blueProgressView];
        }
    }
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
