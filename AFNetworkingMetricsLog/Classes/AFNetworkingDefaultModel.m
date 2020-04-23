//
//  AFNetworkingDefaultModel.m
//  Vostic
//
//  Created by 田云翔 on 2020/4/23.
//  Copyright © 2020 贵阳朗玛信息技术股份有限公司. All rights reserved.
//

#import "AFNetworkingDefaultModel.h"

@implementation AFNetworkingDefaultModel

+ (AFNetworkingDefaultModel *)modelWithTransactionMetrics:(NSURLSessionTaskTransactionMetrics *)transactionMetrics {
    
    AFNetworkingDefaultModel *model = [[AFNetworkingDefaultModel alloc] init];
    
    model.request = transactionMetrics.request;
    
    model.response = transactionMetrics.response;
    
    model.networkProtocolName = transactionMetrics.networkProtocolName;
    
    model.isProxyConnection = transactionMetrics.isProxyConnection;
    
    model.isReusedConnection = transactionMetrics.isReusedConnection;
    
    
    if (@available(iOS 13.0, *)) {
        model.requestBytes = transactionMetrics.countOfRequestHeaderBytesSent + transactionMetrics.countOfRequestBodyBytesSent;
        
        model.responseBytes = transactionMetrics.countOfResponseHeaderBytesReceived + transactionMetrics.countOfResponseBodyBytesReceived;
        
        model.localAddress = transactionMetrics.localAddress;
        
        model.localPort = transactionMetrics.localPort;
        
        model.remoteAddress = transactionMetrics.remoteAddress;
        
        model.remotePort = transactionMetrics.remotePort;
        
        model.cellular = transactionMetrics.cellular;
    }
    
    // 时间相关
    model.fetchStartTime = [transactionMetrics.fetchStartDate timeIntervalSince1970] * 1000;
    
    model.domainLookupWaitDuration = ceil([transactionMetrics.domainLookupStartDate timeIntervalSinceDate:transactionMetrics.fetchStartDate] * 1000);
    
    model.domainLookupDuration = ceil([transactionMetrics.domainLookupEndDate timeIntervalSinceDate:transactionMetrics.domainLookupStartDate] * 1000);
    
    model.connectWaitDuration = ceil([transactionMetrics.connectStartDate timeIntervalSinceDate:transactionMetrics.domainLookupEndDate] * 1000);
    
    model.secureConnectionWaitDuration = ceil([transactionMetrics.secureConnectionStartDate timeIntervalSinceDate:transactionMetrics.connectStartDate] * 1000);
    
    model.secureConnectionDuration = ceil([transactionMetrics.secureConnectionEndDate timeIntervalSinceDate:transactionMetrics.secureConnectionStartDate] * 1000);
    
    model.connectDuration = ceil([transactionMetrics.connectEndDate timeIntervalSinceDate:transactionMetrics.connectStartDate] * 1000);
    
    model.requestDuration = ceil([transactionMetrics.requestEndDate timeIntervalSinceDate:transactionMetrics.requestStartDate] * 1000);
    
    model.responseWaitDuration = ceil([transactionMetrics.responseStartDate timeIntervalSinceDate:transactionMetrics.requestEndDate] * 1000);
    
    model.responseDuration = ceil([transactionMetrics.responseEndDate timeIntervalSinceDate:transactionMetrics.responseStartDate] * 1000);
    
    model.fetchDuration = ceil([transactionMetrics.responseEndDate timeIntervalSinceDate:transactionMetrics.fetchStartDate] * 1000);
    
    return model;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"AFNetworkingDefaultModel:\n{\n%@\nsuccess:%d\nnetworkProtocolName:%@\nisProxyConnection:%d\nisReusedConnection:%d\nrequestBytes:%lld\nresponseBytes:%lld\nlocalAddress:%@\nlocalPort:%@\n,remoteAddress:%@\nremotePort:%@\ncellular:%d\nfetchStartTime:%f\ndomainLookupWaitDuration:%f\ndomainLookupDuration:%f\nsecureConnectionWaitDuration:%f\nsecureConnectionDuration:%f\nconnectWaitDuration:%f\nconnectDuration:%f\nrequestDuration:%f\nresponseWaitDuration:%f\nresponseDuration:%f\nfetchDuration:%f\n}", self.request.URL.absoluteURL, self.isSuccess,self.networkProtocolName, self.isProxyConnection, self.isReusedConnection, self.requestBytes, self.responseBytes, self.localAddress, self.localPort, self.remoteAddress, self.remotePort, self.cellular, self.fetchStartTime, self.domainLookupWaitDuration, self.domainLookupDuration, self.secureConnectionWaitDuration,self.secureConnectionDuration, self.connectWaitDuration ,self.connectDuration, self.requestDuration, self.responseWaitDuration, self.responseDuration, self.fetchDuration];
}

- (BOOL)isSuccess {
    if (self.response) {
        return YES;
    }
    return NO;
}

@end
