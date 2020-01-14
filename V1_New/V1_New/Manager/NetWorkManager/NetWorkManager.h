//
//  NetWorkManager.h
//  IM
//
//  Created by Andy on 2017/9/5.
//  Copyright © 2017年 Linxun. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^success)(id responseObject);
typedef void(^successWithOther)(id responseObject);
typedef void(^fail)(NSError *error);

@interface NetWorkManager : NSObject

/**
 未登录Post请求数据
 @param url 请求地址
 @param params 请求头参数
 @param success 请求成功返回参数
 @param successWithOther 请求成功返回其他参数
 @param fail 请求失败返回参数
 @param isShowSVP 是否显示请求动画
 */

+ (void)basePostData:(NSString *)url params:(NSMutableDictionary *)params success:(success)success successWithOther:(successWithOther)successWithOther fail:(fail)fail isShowSVP:(BOOL)isShowSVP;

/**
 Post请求数据
 @param url 请求地址
 @param params 请求头参数
 @param success 请求成功返回参数
 @param successWithOther 请求成功返回其他参数
 @param fail 请求失败返回参数
 @param isShowSVP 是否显示请求动画
 */

+ (void)postData:(NSString *)url params:(NSMutableDictionary *)params success:(success)success successWithOther:(successWithOther)successWithOther fail:(fail)fail isShowSVP:(BOOL)isShowSVP;


/**
 Get请求数据
 @param url 请求地址
 @param params 请求头参数
 @param success 请求成功返回参数
 @param successWithOther 请求成功返回其他参数
 @param fail 请求失败返回参数
 @param isShowSVP 是否显示请求动画
 */
+ (void)getData:(NSString *)url params:(NSMutableDictionary *)params success:(success)success successWithOther:(successWithOther)successWithOther fail:(fail)fail isShowSVP:(BOOL)isShowSVP;

/**
 Put请求数据
 @param url 请求地址
 @param params 请求头参数
 @param success 请求成功返回参数
 @param successWithOther 请求成功返回其他参数
 @param fail 请求失败返回参数
 @param isShowSVP 是否显示请求动画
 */

+ (void)putData:(NSString *)url params:(NSMutableDictionary *)params success:(success)success successWithOther:(successWithOther)successWithOther fail:(fail)fail isShowSVP:(BOOL)isShowSVP;

/**
 Delete请求数据
 @param url 请求地址
 @param params 请求头参数
 @param success 请求成功返回参数
 @param successWithOther 请求成功返回其他参数
 @param fail 请求失败返回参数
 @param isShowSVP 是否显示请求动画
 */
+ (void)deleteData:(NSString *)url params:(NSMutableDictionary *)params success:(success)success successWithOther:(successWithOther)successWithOther fail:(fail)fail isShowSVP:(BOOL)isShowSVP;

@end
