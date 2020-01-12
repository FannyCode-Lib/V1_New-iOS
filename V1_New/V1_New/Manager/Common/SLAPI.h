//
//  SLAPI.h
//  Social
//
//  Created by LinXun on 2018/12/19.
//  Copyright © 2018 LinXun. All rights 
#ifndef SLAPI_h
#define SLAPI_h

#define STATUS 1

//正式服务器
#if (STATUS == 0)
#define SLURL @"https://ren.linxun.com/narenapi"

#endif

//测试服务器
#if (STATUS == 1)
#define SLURL @"http://114.118.5.138:9001/zuiyouapi"
#endif

//开发服务器
#if (STATUS == 2)
#define SLURL @"http://114.118.5.138:9001/zuiyouapi"

#endif

#pragma mark - Post请求接口
//登录
#define LOGIN @"/user/login"


#endif /* SLAPI_h */
