//
//  NSObject+PHModel.h
//  testModel_OC
//
//  Created by zhangpenghui on 2020/6/25.
//  Copyright © 2020 zph. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (PHModel)

/// 类初始化方法-字典转模型
/// @param dictionary 字典
+(instancetype)ph_modelWithDictionary:(NSDictionary *)dictionary;

/// 字典转模型方法
/// @param dictionary 字典
-(void)ph_modelTransWithDictionary:(NSDictionary *)dictionary;

/// 类初始化方法-json转模型
/// @param jsonString json字符串
+(instancetype)ph_modelWithJsonString:(NSString *)jsonString;

/// json转模型
/// @param jsonString json字符串
-(void)ph_modelTransWithJsonString:(NSString *)jsonString;
@end

NS_ASSUME_NONNULL_END
