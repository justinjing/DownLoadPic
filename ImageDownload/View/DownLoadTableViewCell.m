//
//  DownLoadTableViewCell.m
//  LWConnetionDemo
//
//  Created by justinjing on 15/7/29.
//  Copyright (c) 2015年 justinjing. All rights reserved.
//


#import "DownLoadTableViewCell.h"

@implementation DownLoadTableViewCell

@synthesize imageView;
@synthesize progressView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
         imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 40, 40)];
        [self addSubview:imageView];
        
        progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(60, 20, 250, 20)];
        progressView.hidden = YES;
        [self addSubview:progressView];
    }
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    imageView.center = CGPointMake(30,self.contentView.frame.size.height*0.5);
 
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
