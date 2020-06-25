//
//  TestModel.h
//  testModel_OC
//
//  Created by zhangpenghui on 2020/6/21.
//  Copyright © 2020 zph. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TestModel : NSObject
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *subName;
@property (nonatomic,copy) NSString *sexName;
@property (nonatomic,copy) NSArray <TestModel *> *childrenList;
@property (nonatomic,strong) TestModel *folkpeople;
@property (nonatomic,copy) NSString *allName;
@end

NS_ASSUME_NONNULL_END
