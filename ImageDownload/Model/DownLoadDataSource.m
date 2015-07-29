//
//  DownLoadDataSource.m
//  LWConnetionDemo
//
//  Created by justinjing on 15/7/29.
//  Copyright (c) 2015年 justinjing. All rights reserved.
//

#import "DownLoadDataSource.h"
#import "DownLoadTableViewCell.h"

@implementation DownLoadDataSource

- (instancetype)init {
    if (self = [super init]) {
         _rowData = @[@1,@2,@3];
     }
    return self;
}

- (CGFloat)heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_rowData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    DownLoadTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[DownLoadTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    
    return cell;
}

@end
