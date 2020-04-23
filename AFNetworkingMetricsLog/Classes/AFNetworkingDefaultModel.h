//
//  AFNetworkingDefaultModel.h
//  Vostic
//
//  Created by 田云翔 on 2020/4/23.
//  Copyright © 2020 贵阳朗玛信息技术股份有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AFNetworkingDefaultModel : NSObject

/// 请求是否成功
@property (nonatomic, assign) BOOL isSuccess;

/// 发送的请求内容
@property (nonatomic, strong) NSURLRequest *request;

/// 收到响应的内容，失败时为空
@property (nonatomic, strong) NSURLResponse *response;

/// http的协议
@property (nonatomic, strong) NSString *networkProtocolName;

/// 是否开启代理
@property (nonatomic, assign) BOOL isProxyConnection;

/// 是否通过持久连接来获取资源
@property (nonatomic, assign) BOOL isReusedConnection;

#pragma mark - 时间

/// 任务开始时间
@property (nonatomic, assign) NSTimeInterval fetchStartTime;

/// 整个任务时长
@property (nonatomic, assign) NSTimeInterval fetchDuration;

/// 等待dng解析时长
@property (nonatomic, assign) NSTimeInterval domainLookupWaitDuration;
/// dns解析时长
@property (nonatomic, assign) NSTimeInterval domainLookupDuration;

/// 等待tls握手时长
@property (nonatomic, assign) NSTimeInterval secureConnectionWaitDuration;

/// tls握手时长
@property (nonatomic, assign) NSTimeInterval secureConnectionDuration;

/// 等待tcp连接时长
@property (nonatomic, assign) NSTimeInterval connectWaitDuration;

/// tcp连接时长
@property (nonatomic, assign) NSTimeInterval connectDuration;

/// 请求发送时长
@property (nonatomic, assign) NSTimeInterval requestDuration;

/// 等待响应时长
@property (nonatomic, assign) NSTimeInterval responseWaitDuration;

/// 请求响应时长
@property (nonatomic, assign) NSTimeInterval responseDuration;

#pragma mark - iOS13

/// 请求发送大小
@property (nonatomic, assign) int64_t requestBytes;

/// 收到响应大小
@property (nonatomic, assign) int64_t responseBytes;

/// 本地地址
@property (nonatomic, strong) NSString *localAddress;

/// 本地端口
@property (nonatomic, strong) NSNumber *localPort;

/// 远端地址
@property (nonatomic, strong) NSString *remoteAddress;

/// 远端端口
@property (nonatomic, strong) NSNumber *remotePort;

/// 是否流量
@property (nonatomic, assign) BOOL cellular;

+ (AFNetworkingDefaultModel *)modelWithTransactionMetrics:(NSURLSessionTaskTransactionMetrics *)transactionMetrics;

@end

NS_ASSUME_NONNULL_END
