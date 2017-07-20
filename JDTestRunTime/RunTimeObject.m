//
//  RunTimeObject.m
//  JDTestRunTime
//
//  Created by judy on 2017/5/22.
//  Copyright © 2017年 judy. All rights reserved.
//

#import "RunTimeObject.h"
#import <objc/runtime.h>

@implementation RunTimeObject

+ (id)getCopyWithClass:(id)cla {
    u_int               count;
    
    objc_property_t*    properties= class_copyPropertyList([cla class], &count);
    
    id retModel = [[[cla class] alloc] init];
    if (count) {
        for (int i = 0; i < count ; i++) {
            const char* char_f =property_getName(properties[i]);
            NSString *propertyName = [NSString stringWithUTF8String:char_f];
            id propertyValue = [cla valueForKey:(NSString *)propertyName];
            Class class = [propertyValue class];
            if ([class isSubclassOfClass:[NSMutableArray class]]) {
                NSMutableArray *arr = [NSMutableArray arrayWithArray:propertyValue];
                [retModel setValue:arr forKey:propertyName];
            }
            if ([class isSubclassOfClass:[NSMutableString class]]) {
                NSMutableString *str = [[NSMutableString alloc] initWithString:propertyValue];
                [retModel setValue:str forKey:propertyName];
            }
            
            if ([class isSubclassOfClass:[NSMutableDictionary class]]) {
                NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithDictionary:propertyValue];
                [retModel setValue:dic forKey:propertyName];
            }
        }
    } else {
        if ([cla isKindOfClass:[NSMutableDictionary class]]) {
            retModel = [NSMutableDictionary dictionary];
            NSMutableDictionary *dict = cla;
            for (int i = 0; i < dict.count; i ++) {
                [retModel setValue:dict[dict.allKeys[i]] forKey:dict.allKeys[i]];
            }
        } else if ([cla isKindOfClass:[NSMutableArray class]]) {
            retModel = [NSMutableArray array];
            NSMutableArray *arr = cla;
            for (int i = 0; i < arr.count; i ++) {
                [retModel addObject:arr[i]];
            }
        } else if ([cla isKindOfClass:[NSMutableString class]]) {
            retModel = [[NSMutableString alloc] initWithString:cla];
        }
    }
    return retModel;
}

@end
