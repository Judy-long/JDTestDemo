//
//  RunModel.m
//  JDTestRunTime
//
//  Created by judy on 2017/5/22.
//  Copyright © 2017年 judy. All rights reserved.
//

#import "RunModel.h"
#import <objc/runtime.h>
#import "RunTimeObject.h"

@implementation RunModel

- (id)copy {    
    return [RunTimeObject getCopyWithClass:self];
}

@end
