//
//  ViewController.m
//  ImageDownload
//
//  Created by justinjing on 15/7/29.
//  Copyright (c) 2015年 justinjing. All rights reserved.
//

#import "ViewController.h"
#import "DownLoadTableView.h"

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"DownLoad";
    self.view.backgroundColor =[UIColor whiteColor];
    
    [self.view addSubview:({
        DownLoadTableView *view=[[DownLoadTableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width,self.view.bounds.size.width)];
        view;
    })];
}

@end
