//
//  TestModel.m
//  testModel_OC
//
//  Created by zhangpenghui on 2020/6/21.
//  Copyright © 2020 zph. All rights reserved.
//

#import "TestModel.h"
#import <objc/runtime.h>

@implementation TestModel

-(NSDictionary *)modelCustomPropertyMap {
    return @{@"sexName": @"sex",
             @"folkpeople": @"folk",
    };
}

-(NSDictionary *)modelCustomPropertyClassMap {
    return @{@"folk": [TestModel class]};
}

-(NSDictionary *)modelCustomPropertyArrayClassMap {
    return @{@"childrenList": [TestModel class]};
}

-(void)modelTransfromFinsh:(NSDictionary *)dictionary {
    
    _allName = [NSString stringWithFormat:@"%@%@", _name, _subName];
}

@end
