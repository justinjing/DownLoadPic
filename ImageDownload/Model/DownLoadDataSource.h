//
//  DownLoadDataSource.h
//  LWConnetionDemo
//
//  Created by justinjing on 15/7/29.
//  Copyright (c) 2015年 justinjing. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface DownLoadDataSource : NSObject<UITableViewDataSource>

@property (nonatomic, strong) NSArray *rowData;

- (CGFloat)heightForRowAtIndexPath:(NSIndexPath *)indexPath;

@end
