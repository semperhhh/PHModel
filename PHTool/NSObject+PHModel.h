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

/// class 未知类型转模型
/// @param unknow 未知类型
+(instancetype)ph_modelWithUnknowType:(id)unknow;

/// 未知类型转模型
/// @param unknow 未知类型
-(void)ph_modelTransWithUnknowType:(id)unknow;

/// 映射自定义字段
// @{@"custom": "str"}
-(NSDictionary <NSString *, NSString *> *)modelCustomPropertyMap;

/// 映射自定义类
// @{@"cla": [custom class]}
-(NSDictionary <NSString *, Class> *)modelCustomPropertyClassMap;

/// 映射数组里的自定义类
// {@"list": [customClass class]}
-(NSDictionary <NSString *, Class> *)modelCustomPropertyArrayClassMap;

/// 映射完成后执行的操作
/// @param dictionary 被映射的字典
-(void)modelTransfromFinsh:(NSDictionary *)dictionary;
@end

NS_ASSUME_NONNULL_END
