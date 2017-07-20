//
//  ViewController.m
//  JDTestRunTime
//
//  Created by judy on 2017/5/22.
//  Copyright © 2017年 judy. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "RunModel.h"
#import "RunTimeObject.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

//    [self testPrint];
    
    RunModel *model = [[RunModel alloc] init];
    model.runName = [[NSMutableString alloc] initWithString:@"nimei"];
    NSMutableString *str1 = [[NSMutableString alloc] initWithString:@"A"];
    NSMutableString *str2 = [[NSMutableString alloc] initWithString:@"B"];
    NSMutableString *str3 = [[NSMutableString alloc] initWithString:@"C"];
    model.runArray = [NSMutableArray arrayWithObjects:str1, str2, str3, nil];
    model.runDict = [NSMutableDictionary dictionaryWithDictionary:@{@"hehe" : @"123", @"jjk" : @"kk", @"dict" : @{@"eee" : @"2222", @"dddd" : @"4444"}}];
    
    RunModel *model1 = model.copy;
    model1.runName = [[NSMutableString alloc] initWithString:@"zhe"];
    [model1.runArray replaceObjectAtIndex:0 withObject:[[NSMutableString alloc] initWithString:@"F"]];
    [model1.runDict setValue:@{@"eee" : @"333", @"dddd" : @"5555"} forKey:@"dict"];
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:@{@"hhhh" : @"dddd", @"lkn" : @"asdfa"}];
    NSMutableDictionary *dict1 = [RunTimeObject getCopyWithClass:dict];
    [dict1 setObject:@"aaa" forKey:@"hhhh"];
    
    NSLog(@"%@", model1);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
