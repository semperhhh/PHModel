//
//  NSObject+PHModel.m
//  testModel_OC
//
//  Created by zhangpenghui on 2020/6/25.
//  Copyright © 2020 zph. All rights reserved.
//

#import "NSObject+PHModel.h"
#import <objc/runtime.h>

@implementation NSObject (PHModel)

+(instancetype)ph_modelWithUnknowType:(id)unknow {
    
    NSObject *obj = [[self alloc]init];
    [obj ph_modelTransWithUnknowType:unknow];
    return obj;
}

-(void)ph_modelTransWithUnknowType:(id)unknow {
    
    NSDictionary *dictionary;
    if ([unknow isKindOfClass:[NSDictionary class]]) {
        dictionary = (NSDictionary *)unknow;
    } else if ([unknow isKindOfClass:[NSString class]]) {
        NSData *data = [(NSString *)unknow dataUsingEncoding:NSUTF8StringEncoding];
        dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    } else if ([unknow isKindOfClass:[NSData class]]) {
        dictionary = [NSJSONSerialization JSONObjectWithData:(NSData *)unknow options:NSJSONReadingMutableContainers error:nil];
    }
    [self ph_modelTransWithDictionary:dictionary];
}

+(instancetype)ph_modelWithDictionary:(NSDictionary *)dictionary {
    
    NSObject *obj = [[self alloc]init];
    [obj ph_modelTransWithDictionary:dictionary];
    
    return obj;
}

-(void)ph_modelTransWithDictionary:(NSDictionary *)dictionary {

    if (![dictionary isKindOfClass:[NSDictionary class]]) {
        return;
    }
    
    NSObject *obj = self;
    
    NSMutableArray *keys = [NSMutableArray array];
    
    unsigned count = 0;
    objc_property_t *propertyList = class_copyPropertyList([obj class], &count);
    
    for (int i = 0; i < count; i ++) {
        
        objc_property_t property = propertyList[i];
        const char *propertyCString = property_getName(property);
        NSString *propertyName = [NSString stringWithCString:propertyCString encoding:NSUTF8StringEncoding];
        [keys addObject:propertyName];
    }
    
    for (NSString *key in keys) {
        
        //custom key value
        id idkey = [obj modelCustomPropertyMap][key] == nil ? key : [obj modelCustomPropertyMap][key];
        id idvalue = [dictionary valueForKey:idkey];
        
        if (idvalue == nil) {
            continue;
        }
        
        //key is array, custom value class
        if ([idvalue isKindOfClass:[NSArray class]]) {
            
            if ([obj modelCustomPropertyArrayClassMap][idkey] != nil) {
                
                Class methodClass = [obj modelCustomPropertyArrayClassMap][idkey];
                
                NSMutableArray *nmarray = [NSMutableArray array];
                
                for (NSDictionary *arrayDict in idvalue) {
                    id model = [methodClass ph_modelWithDictionary: arrayDict];
                    [nmarray addObject:model];
                }
            
                idvalue = nmarray;
            }
        }
        
        //key is custom class
        if ([idvalue isKindOfClass: [NSDictionary class]]) {
             
            if ([obj modelCustomPropertyClassMap][idkey] != nil) {
                Class methodClass = [obj modelCustomPropertyClassMap][idkey];
                id model = [methodClass ph_modelWithDictionary: idvalue];
                idvalue = model;
            }
        }

        [obj setValue:idvalue forKey:key];
//        NSLog(@"property name: %@, key: %@", key, idvalue);
    }
    
    //property transform finsh, custom something
    [obj modelTransfromFinsh:dictionary];
}

+(instancetype)ph_modelWithJsonString:(NSString *)jsonString {
    
    NSObject *obj = [[self alloc]init];
    [obj ph_modelTransWithJsonString:jsonString];
    return obj;
}

-(void)ph_modelTransWithJsonString:(NSString *)jsonString {
    
    if (![jsonString isKindOfClass:[NSString class]]) {
        return;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&err];
    if (err) {
        NSLog(@"json解析失败: %@", err);
        return;
    }
    
    [self ph_modelTransWithDictionary:dictionary];
}

/// 映射自定义字段
-(NSDictionary <NSString *, NSString *> *)modelCustomPropertyMap {
    
    return @{};
}

/// 映射自定义类
-(NSDictionary <NSString *, Class> *)modelCustomPropertyClassMap {
    return @{};
}

/// 映射数组里的自定义类
//{@"list": [customClass class]}
-(NSDictionary <NSString *, Class> *)modelCustomPropertyArrayClassMap {
    return @{};
}

/// 映射完成后执行的操作
/// @param dictionary 被映射的字典
-(void)modelTransfromFinsh:(NSDictionary *)dictionary {
    
    
}


@end
