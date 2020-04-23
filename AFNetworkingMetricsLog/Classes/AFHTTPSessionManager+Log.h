//
//  AFHTTPSessionManager+Log.h
//  Vostic
//
//  Created by 田云翔 on 2020/4/23.
//  Copyright © 2020 贵阳朗玛信息技术股份有限公司. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@protocol AFHTTPSessionLogger <NSObject>

@required
- (void)taskLogWithSession:(NSURLSession * _Nonnull)session task:(NSURLSessionTask * _Nonnull)task metrics:(NSURLSessionTaskMetrics * _Nullable)metrics;

@end

NS_ASSUME_NONNULL_BEGIN

@interface AFHTTPSessionManager (Log)

- (void)startLog;

- (void)stopLog;

- (void)addLogger:(id <AFHTTPSessionLogger>)logger;

- (void)removeLogger:(id <AFHTTPSessionLogger>)logger;

- (void)clearLoggers;

@end

NS_ASSUME_NONNULL_END
