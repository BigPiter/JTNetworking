//
//  JTRequestManager.h
//  DiscuzMobile
//
//  Created by 张积涛 on 2018/2/2.
//  Copyright © 2018年 com.comzenz-service. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JTRequestOperation.h"

@interface JTRequestManager : NSObject

/**
 *  请求方法 get/post
 *
 *  @param config           请求配置  Block
 *  @param success          请求成功的 Block
 *  @param failed           请求失败的 Block
 */
+ (void)requestWithConfig:(JTRequestConfig)config  success:(JTRequestSuccess)success failed:(JTRequestFailed)failed;

/**
 *  请求方法 get/post/Upload/DownLoad
 *
 *  @param config           请求配置  Block
 *  @param progress         请求进度  Block
 *  @param success          请求成功的 Block
 *  @param failed           请求失败的 Block
 */
+ (void)requestWithConfig:(JTRequestConfig)config  progress:(JTProgressBlock)progress success:(JTRequestSuccess)success failed:(JTRequestFailed)failed;


/**
 是否缓存过了

 @param request 请求对象
 */

/**
 是否缓存过了

 @param urlString 地址
 @param parameters 传递的参数
 @return 是否
 */
+ (BOOL)isCache:(NSString *)urlString andParameters:(id)parameters;

/**
 取消请求任务
 
 @param urlString           协议接口
 @param completion          后续操作
 */
+ (void)cancelRequest:(NSString *)urlString completion:(JTCancelCompletedBlock)completion;


@end
