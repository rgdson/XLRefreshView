//
//  ViewController.m
//  下拉刷新联系Demo
//
//  Created by Mac020 on 16/1/14.
//  Copyright © 2016年 XL10014. All rights reserved.
//

#import "ViewController.h"
#import "XLRefreshView.h"

@interface ViewController ()<UIScrollViewDelegate,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (nonatomic,strong) XLRefreshView * refreView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.mainTableView.delegate = self;
    
    self.refreView = [XLRefreshView defaultRefreshView];
    [self.view addSubview:self.refreView];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    self.refreView.frame = CGRectMake(0, -(scrollView.contentOffset.y + 50), [UIScreen mainScreen].bounds.size.width, 50);
    [self.refreView scrollViewContentOffset:scrollView tableViewTopViewBlock:^{
        NSLog(@"松手了开始刷新！！！");
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
