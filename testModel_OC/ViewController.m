//
//  ViewController.m
//  testModel_OC
//
//  Created by zhangpenghui on 2020/6/21.
//  Copyright © 2020 zph. All rights reserved.
//

#import "ViewController.h"
#import "TestModel.h"
#import "NSObject+PHModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*
    NSDictionary *dict = @{@"name": @"zh"};
    TestModel *model = [TestModel ph_modelWithDictionary:dict];
    
    NSDictionary *dict1 = @{
                           @"subName": @"san",
                           @"sex": @1,
                           @"childrenList": @[@{@"name": @"张三",
                                                  @"subName": @"三",
                                                  @"sex": @1,
                                              },
                                              @{@"name": @"李四",
                                                @"subName": @"四",
                                                @"sex": @1,
                                              }
                           ],
                           @"folk": @{@"name": @"王五",
                                      @"sex": @0,
                           },
    };
    
    model = [model ph_modelTransWithDictionary:dict1];
    
    NSLog(@"%@ ---- %p -- %@ --%@",model, &model, model.allName, model.folkpeople.allName);
    */
    
    NSString *jsonString = @"{\"name\": \"zhang\",\"subName\": \"san\"}";
    
    TestModel *model = [TestModel ph_modelWithJsonString:jsonString];
    NSLog(@"jsonString = %@", model.name);
}


@end
