//
//  ViewController.m
//  ImageDownload
//
//  Created by justinjing on 15/7/29.
//  Copyright (c) 2015年 justinjing. All rights reserved.
//

#import "ViewController.h"

#import "LWConnectionManager.h"
#import "DownLoadDataSource.h"
#import "DownLoadTableViewCell.h"


#define DL_SCREEN_HEIGHT ((float)[[UIScreen mainScreen] bounds].size.height)
#define DL_SCREEN_WIDTH  ((float)[[UIScreen mainScreen] bounds].size.width)

@interface ViewController () <UITableViewDelegate,LWConnectionDelegate>
{
    LWConnectionManager *connetionManager;
    NSArray * urlArr;
}

@property(nonatomic ,strong)UITableView *rightTableView;
@property(nonatomic, strong)DownLoadDataSource *dataSource;
@end


@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"DownLoad";
    self.view.backgroundColor =[UIColor whiteColor];
    connetionManager = [LWConnectionManager defaultManager];
    
    urlArr = [[NSArray alloc] initWithObjects:@"http://www.wallcoo.com/nature/Japan_Hokkaido_Furano_Country_field_1920x1200/wallpapers/1920x1080/Japan-Hokkaido-Landscape-WUXGA_country_field_0149.jpg",
              @"http://d.hiphotos.baidu.com/baike/c0%3Dbaike80%2C5%2C5%2C80%2C26/sign=487e85ccd158ccbf0fb1bd6878b1d75b/8ad4b31c8701a18b7c763e319e2f07082838fe2b.jpg",
              @"http://c.hiphotos.baidu.com/baike/c0%3Dbaike92%2C5%2C5%2C92%2C30/sign=89d10008ddc451dae2fb04b9d7943903/08f790529822720e9ef77aac7bcb0a46f21fabaf.jpg",
              @"http://f.hiphotos.baidu.com/baike/c0%3Dbaike72%2C5%2C5%2C72%2C24/sign=7616f810d40735fa85fd46ebff3864d6/0d338744ebf81a4c8c01b6c2d72a6059252da68e.jpg",nil];
    
    self.dataSource = [[DownLoadDataSource alloc] init];
    self.dataSource.rowData = urlArr;
    
    self.rightTableView=[[UITableView alloc]initWithFrame:CGRectMake(0,0, DL_SCREEN_WIDTH,DL_SCREEN_HEIGHT) style:UITableViewStylePlain];
    self.rightTableView.backgroundColor = [UIColor clearColor];
    self.rightTableView.scrollsToTop = YES;
    self.rightTableView.dataSource = self.dataSource;
    self.rightTableView.delegate = self;
    
    self.rightTableView.showsVerticalScrollIndicator=NO;
    self.rightTableView.tableFooterView = [UIView new];
    [self.view addSubview:self.rightTableView];
    
    [self startDownload];
}


- (void)startDownload {
    for (int i = 0 ; i <[urlArr count]; i++) {
        LWRequest *request = [[LWRequest alloc] initWithTraget:[NSString stringWithFormat:@"%d",i] requestURL:[urlArr objectAtIndex:i] isPersistance:YES delegate:self];
        [connetionManager addRequest:request];
    }
}

#pragma mark - Table view datasource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.dataSource heightForRowAtIndexPath:indexPath];
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}


#pragma mark -- LW connetion delegate
- (void)downloadFinished:(LWResponse *)response
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[response.responseTarget integerValue] inSection:0];
    DownLoadTableViewCell *cell = (DownLoadTableViewCell *)[self.rightTableView cellForRowAtIndexPath:indexPath];
    if (response.error) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:[response.error description] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        NSLog(@"response error %@",response.error);
        [alertView show];
    } else {
        if (response.responseData) {
            UIImage *image = [UIImage imageWithData:response.responseData];
            if (image) {
                if (cell) {
                    [cell.imageView setImage:image];
                    [cell.progressView setHidden:YES];
                }
            }
        }
    }
}

- (void)downloadInprogress:(LWResponse *)response
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[response.responseTarget integerValue] inSection:0];
    DownLoadTableViewCell *cell = (DownLoadTableViewCell *)[self.rightTableView cellForRowAtIndexPath:indexPath];
    if (response.error) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:[response.error description] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    } else {
        if (cell) {
            [cell.progressView setHidden:NO];
            [cell.progressView setProgress:response.downloadRate];
        }
        
    }
}
@end
