//
//  AFNetworkingDefaultLogger.m
//  Vostic
//
//  Created by 田云翔 on 2020/4/23.
//  Copyright © 2020 贵阳朗玛信息技术股份有限公司. All rights reserved.
//

#import "AFNetworkingDefaultLogger.h"
#import "AFNetworkingDefaultModel.h"

@interface AFNetworkingDefaultLogger ()

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation AFNetworkingDefaultLogger

- (void)taskLogWithSession:(NSURLSession *)session task:(NSURLSessionTask *)task metrics:(NSURLSessionTaskMetrics *)metrics {
    [metrics.transactionMetrics enumerateObjectsUsingBlock:^(NSURLSessionTaskTransactionMetrics *_Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
        if (obj.resourceFetchType == NSURLSessionTaskMetricsResourceFetchTypeNetworkLoad) {
            AFNetworkingDefaultModel *model = [AFNetworkingDefaultModel modelWithTransactionMetrics:obj];
            NSLog(@"%@", model.description);
        }
    }];
}

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

@end
