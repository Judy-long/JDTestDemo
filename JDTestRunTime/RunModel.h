//
//  RunModel.h
//  JDTestRunTime
//
//  Created by judy on 2017/5/22.
//  Copyright © 2017年 judy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RunModel : NSObject

@property (nonatomic, copy) NSMutableString *runName;

@property (nonatomic, strong) NSMutableArray *runArray;

@property (nonatomic, strong) NSMutableDictionary *runDict;

@end
