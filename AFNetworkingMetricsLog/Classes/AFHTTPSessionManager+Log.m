//
//  AFHTTPSessionManager+Log.m
//  Vostic
//
//  Created by 田云翔 on 2020/4/23.
//  Copyright © 2020 贵阳朗玛信息技术股份有限公司. All rights reserved.
//

#import "AFHTTPSessionManager+Log.h"
#import <objc/runtime.h>

@interface AFHTTPSessionManager ()

@property (nonatomic, strong) NSMutableArray <id <AFHTTPSessionLogger>> *loggers;

@end

@implementation AFHTTPSessionManager (Log)

- (void)setLoggers:(NSMutableArray <id <AFHTTPSessionLogger>> *)loggers {
    objc_setAssociatedObject(self, @selector(loggers), loggers, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSMutableArray<id <AFHTTPSessionLogger>> *)loggers {
    return objc_getAssociatedObject(self, @selector(loggers));
}

- (void)startLog {
    if (@available(iOS 10.0, *)) {
        __weak typeof(self) weakSelf = self;
        [self setTaskDidFinishCollectingMetricsBlock:^(NSURLSession * _Nonnull session, NSURLSessionTask * _Nonnull task, NSURLSessionTaskMetrics * _Nullable metrics) {
            [weakSelf taskLogWithSession:session task:task metrics:metrics];
        }];
    } else {
        NSLog(@"AFHTTPSessionLogger-Error-Only supports versions above 10.0");
    }
}

- (void)stopLog {
    [self setTaskDidFinishCollectingMetricsBlock:nil];
}

- (void)addLogger:(id <AFHTTPSessionLogger>)logger {
    if (![logger respondsToSelector:@selector(taskLogWithSession:task:metrics:)]) {
        NSLog(@"AFHTTPSessionLogger-Warning-%@ does not conform to protocol 'AFHTTPSessionLogger'", NSStringFromClass([logger class]));
        return;
    }
    if (!self.loggers) {
        self.loggers = [NSMutableArray array];
    }
    [self.loggers addObject:logger];
}

- (void)removeLogger:(id<AFHTTPSessionLogger>)logger {
    [self.loggers removeObject:logger];
}

- (void)clearLoggers {
    [self.loggers removeAllObjects];
}

- (void)taskLogWithSession:(NSURLSession * _Nonnull)session task:(NSURLSessionTask * _Nonnull)task metrics:(NSURLSessionTaskMetrics * _Nullable)metrics {
    for (id <AFHTTPSessionLogger> logger in self.loggers) {
        [logger taskLogWithSession:session task:task metrics:metrics];
    }
}

@end
