//
//  NetWorkManager.m
//  IM
//
//  Created by Andy on 2017/9/5.
//  Copyright © 2017年 Linxun. All rights reserved.
//

@implementation NetWorkManager

#pragma mark - 发起网络请求

+ (void)basePostData:(NSString *)url params:(NSMutableDictionary *)params success:(success)success successWithOther:(successWithOther)successWithOther fail:(fail)fail isShowSVP:(BOOL)isShowSVP{
    if (isShowSVP) {
        [SVProgressHUD showWithStatus:nil];
    }
    NSMutableDictionary *postParams = params;
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.securityPolicy = securityPolicy;
    manager.responseSerializer.acceptableContentTypes =  [NSSet setWithObjects:@"application/json", @"text/json",
                                                          @"text/javascript", @"text/html",
                                                          @"application/xml", @"text/plain",nil];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 15;
    NSString *urlString = [NSString stringWithFormat:@"%@%@",SLURL, url];
    MyNSLog(@"传入参数：\n%@",params);
    MyNSLog(@"请求地址：\n%@",urlString);
    NSMutableString *str = [NSMutableString new];
    [str appendFormat:@"%@?%@",urlString,params];
    MyNSLog(@"带参数的地址：\n%@",str);
    [manager POST:urlString  parameters:postParams progress:nil success:^(NSURLSessionDataTask* _Nonnull task, id _Nullable responseObject){
        if (isShowSVP) {
            [SVProgressHUD dismissWithDelay:0.25];
        }
        NSData *responseData = responseObject;
        NSString *jsonString = [[NSString alloc]initWithData:responseData encoding:NSUTF8StringEncoding];
        NSData *JSONData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *response = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingMutableLeaves error:nil];
        MyNSLog(@"响应：\n%@",response);
        if ([response[@"code"] intValue] == 0) {
            success(response);
            return;
        }else {
            successWithOther(response);
            return;
        }
    }failure:^(NSURLSessionDataTask* _Nullable task, NSError* _Nonnull error){
        if (isShowSVP) {
            [SVProgressHUD dismissWithDelay:0.25];
        }
        fail(error);
        MyNSLog(@"%@", error);
        return ;
        
    }];
}

+ (void)postData:(NSString *)url params:(NSMutableDictionary *)params success:(success)success successWithOther:(successWithOther)successWithOther fail:(fail)fail isShowSVP:(BOOL)isShowSVP{
    if (isShowSVP) {
        [SVProgressHUD showWithStatus:nil];
    }
    NSMutableDictionary *postParams = params;
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.securityPolicy = securityPolicy;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json",
                                                          @"text/javascript", @"text/html",
                                                          @"application/xml", @"text/plain",nil];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 15;
    NSString *urlString = [NSString stringWithFormat:@"%@%@",SLURL, url];
    MyNSLog(@"传入参数：\n%@",params);
    MyNSLog(@"请求地址：\n%@",urlString);
    NSMutableString *str = [NSMutableString new];
    [str appendFormat:@"%@?%@",urlString,params];
    MyNSLog(@"带参数的地址：\n%@",urlString);
    [manager POST:urlString  parameters:postParams progress:nil success:^(NSURLSessionDataTask* _Nonnull task, id _Nullable responseObject){
        if (isShowSVP) {
            [SVProgressHUD dismissWithDelay:0.25];
        }
        NSData *responseData = responseObject;
        NSString *jsonString = [[NSString alloc]initWithData:responseData encoding:NSUTF8StringEncoding];
        NSData *JSONData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *response = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingMutableLeaves error:nil];
        MyNSLog(@"响应：\n%@",response);
        if ([response[@"code"] intValue] == 0) {
            success(response);
            return;
        }else {
            if ([response[@"code"] intValue] == 3) {
                [NetWorkManager offLineAction];
                return;
            }
            successWithOther(response);
            return;
        }
    }failure:^(NSURLSessionDataTask* _Nullable task, NSError* _Nonnull error){
        if (isShowSVP) {
            [SVProgressHUD dismissWithDelay:0.25];
        }
        fail(error);
        MyNSLog(@"%@", error);
        return ;
        
    }];
}

+ (void)getData:(NSString *)url params:(NSMutableDictionary *)params success:(success)success successWithOther:(successWithOther)successWithOther fail:(fail)fail isShowSVP:(BOOL)isShowSVP{
    NSMutableDictionary *postParams = params;
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.securityPolicy = securityPolicy;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json",
                                                          @"text/javascript", @"text/html",
                                                          @"application/xml", @"text/plain",nil];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 15;
    NSString *urlString = [NSString stringWithFormat:@"%@%@",SLURL, url];
    MyNSLog(@"请求地址：\n%@",urlString);
    [manager GET:urlString parameters:postParams progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        MyNSLog(@"响应：\n%@",responseObject);
        NSData *responseData = responseObject;
        NSString *jsonString = [[NSString alloc]initWithData:responseData encoding:NSUTF8StringEncoding];
        NSData *JSONData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *response = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingMutableLeaves error:nil];
        MyNSLog(@"响应：\n%@",response);
        if ([response[@"code"] intValue] == 0) {
            if (isShowSVP) {
                [SVProgressHUD dismissWithDelay:0.25];
            }
            success(response);
            return;
        }else {
            if (isShowSVP) {
                [SVProgressHUD dismissWithDelay:0.25];
            }
            if ([response[@"code"] intValue] == 3) {
                [NetWorkManager offLineAction];
                return;
            }
            successWithOther(response);
            return;
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail(error);
        MyNSLog(@"%@", error);
        return ;
    }];
}

+ (void)putData:(NSString *)url params:(NSMutableDictionary *)params success:(success)success successWithOther:(successWithOther)successWithOther fail:(fail)fail isShowSVP:(BOOL)isShowSVP{
    if (isShowSVP) {
        [SVProgressHUD showWithStatus:nil];
    }
    NSMutableDictionary *postParams = params;
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.securityPolicy = securityPolicy;
    manager.responseSerializer.acceptableContentTypes =  [NSSet setWithObjects:@"application/json", @"text/json",
                                                          @"text/javascript", @"text/html",
                                                          @"application/xml", @"text/plain",nil];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 10;
    NSString *urlString = [NSString stringWithFormat:@"%@%@",SLURL, url];
    MyNSLog(@"传入参数：\n%@",params);
    MyNSLog(@"请求地址：\n%@",urlString);
    NSMutableString *str = [NSMutableString new];
    [str appendFormat:@"%@?%@",urlString,params];
    MyNSLog(@"带参数的地址：\n%@",str);
    [manager PUT:urlString parameters:postParams success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (isShowSVP) {
            [SVProgressHUD dismissWithDelay:0.25];
        }
        NSData *responseData = responseObject;
        NSString *jsonString = [[NSString alloc]initWithData:responseData encoding:NSUTF8StringEncoding];
        NSData *JSONData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *response = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingMutableLeaves error:nil];
        MyNSLog(@"响应：\n%@",response);
        if ([response[@"code"] intValue] == 0) {
            success(response);
            return;
        }else {
            if ([response[@"code"] intValue] == 3) {
                [NetWorkManager offLineAction];
                return;
            }
            successWithOther(response);
            return;
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (isShowSVP) {
            [SVProgressHUD dismissWithDelay:0.25];
        }
        fail(error);
        MyNSLog(@"%@", error);
        return ;
    }];
}

+ (void)deleteData:(NSString *)url params:(NSMutableDictionary *)params success:(success)success successWithOther:(successWithOther)successWithOther fail:(fail)fail isShowSVP:(BOOL)isShowSVP{
    if (isShowSVP) {
        [SVProgressHUD showWithStatus:nil];
    }
    NSMutableDictionary *postParams = params;
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.securityPolicy = securityPolicy;
    manager.responseSerializer.acceptableContentTypes =  [NSSet setWithObjects:@"application/json", @"text/json",
                                                          @"text/javascript", @"text/html",
                                                          @"application/xml", @"text/plain",nil];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 10;
    NSString *urlString = [NSString stringWithFormat:@"%@%@",SLURL, url];
    MyNSLog(@"传入参数：\n%@",params);
    MyNSLog(@"请求地址：\n%@",urlString);
    NSMutableString *str = [NSMutableString new];
    [str appendFormat:@"%@?%@",urlString,params];
    MyNSLog(@"带参数的地址：\n%@",str);
    [manager DELETE:urlString parameters:postParams success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (isShowSVP) {
            [SVProgressHUD dismissWithDelay:0.25];
        }
        NSData *responseData = responseObject;
        NSString *jsonString = [[NSString alloc]initWithData:responseData encoding:NSUTF8StringEncoding];
        NSData *JSONData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *response = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingMutableLeaves error:nil];
        MyNSLog(@"响应：\n%@",response);
        if ([response[@"code"] intValue] == 0) {
            success(response);
            return;
        }else {
            if ([response[@"code"] intValue] == 3) {
                [NetWorkManager offLineAction];
                return;
            }
            successWithOther(response);
            return;
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (isShowSVP) {
            [SVProgressHUD dismissWithDelay:0.25];
        }
        fail(error);
        MyNSLog(@"%@", error);
        return ;
    }];
}

@end
