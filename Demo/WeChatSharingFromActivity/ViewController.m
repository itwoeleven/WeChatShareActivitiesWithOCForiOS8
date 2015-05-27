//
//  ViewController.m
//  WeChatSharingFromActivity
//
//  Created by Leo Han on 15/5/13.
//  Copyright (c) 2015年 Leo Han. All rights reserved.
//

#import "ViewController.h"
#import "WeChatMomentsActivity.h"
#import "WeChatSessionActivity.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  UIButton *btnOne = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [btnOne setFrame:CGRectMake(100, 200, 100, 200)];
  [btnOne setTitle:@"ActivityButton" forState:UIControlStateNormal];
  [btnOne addTarget:self action:@selector(showActivityView) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:btnOne];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)showActivityView {
  UIImage *shareMomentImage = [UIImage imageNamed:@"wechat_moments"];
  UIImage *shareSessionImage = [UIImage imageNamed:@"wechat_session"];
  NSArray *activityItems = @[shareMomentImage, shareSessionImage];
  WeChatMomentsActivity *momentsActivity = [[WeChatMomentsActivity alloc] init];
  WeChatSessionActivity *sessionActivity = [[WeChatSessionActivity alloc] init];
  NSArray *activities = @[momentsActivity, sessionActivity];
  UIActivityViewController *activityView = [[UIActivityViewController alloc] initWithActivityItems:activityItems
                                                                             applicationActivities:activities];
  [self presentViewController:activityView animated:YES completion:nil];
}

@end
