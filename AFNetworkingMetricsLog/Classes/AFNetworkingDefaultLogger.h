//
//  AFNetworkingDefaultLogger.h
//  Vostic
//
//  Created by 田云翔 on 2020/4/23.
//  Copyright © 2020 贵阳朗玛信息技术股份有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager+Log.h"

NS_ASSUME_NONNULL_BEGIN

@interface AFNetworkingDefaultLogger : NSObject <AFHTTPSessionLogger>

@end

NS_ASSUME_NONNULL_END
