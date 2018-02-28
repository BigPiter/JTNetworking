//
//  JTRequestManager.m
//  DiscuzMobile
//
//  Created by 张积涛 on 2018/2/2.
//  Copyright © 2018年 com.comzenz-service. All rights reserved.
//

#import "JTRequestManager.h"

@implementation JTRequestManager

#pragma mark - 配置请求
+ (void)requestWithConfig:(JTRequestConfig)config success:(JTRequestSuccess)success failed:(JTRequestFailed)failed{
    [self requestWithConfig:config progress:nil success:success failed:failed];
}

+ (void)requestWithConfig:(JTRequestConfig)config progress:(JTProgressBlock)progress success:(JTRequestSuccess)success failed:(JTRequestFailed)failed{
    
    JTURLRequest *request=[[JTURLRequest alloc]init];
    config ? config(request) : nil;
    
    [[JTRequestOperation shareInstance] sendRequest:request progress:progress success:success failed:failed];
}

+ (BOOL)isCache:(NSString *)urlString andParameters:(id)parameters {
    JTURLRequest *request = [[JTURLRequest alloc] init];
    request.urlString = urlString;
    if (parameters != nil) {
        request.parameters = parameters;
    }
    return [[JTRequestOperation shareInstance] isCache:request];
}

+ (void)cancelRequest:(NSString *)urlString completion:(JTCancelCompletedBlock)completion {
    if([urlString isEqualToString:@""]||urlString==nil)return;
    
    NSString *cancelUrlString=[[JTRequestOperation shareInstance] cancelRequest:urlString];
    if (completion) {
        completion(cancelUrlString);
    }
}


@end
