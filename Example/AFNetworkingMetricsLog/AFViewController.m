//
//  AFViewController.m
//  AFNetworkingMetricsLog
//
//  Created by YasinTian on 04/23/2020.
//  Copyright (c) 2020 YasinTian. All rights reserved.
//

#import "AFViewController.h"
#import "AFHTTPSessionManager+Log.h"
#import "AFNetworkingDefaultLogger.h"

@interface AFViewController ()

@property (nonatomic, strong) AFHTTPSessionManager *manager;

@end

@implementation AFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.manager = [AFHTTPSessionManager manager];
    self.manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    self.manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    self.manager.requestSerializer.timeoutInterval = 10;
    
    [self.manager addLogger:[[AFNetworkingDefaultLogger alloc] init]];
    [self.manager startLog];
}


- (IBAction)baidu:(id)sender {
    [self.manager GET:@"https://www.baidu.com" parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

- (IBAction)google:(id)sender {
    [self.manager GET:@"https://www.google.com" parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

@end
