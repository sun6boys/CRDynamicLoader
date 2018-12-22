//
//  DemoTest.m
//  CRDynamicLoader
//
//  Created by Charon on 2018/12/22.
//  Copyright © 2018年 Charon. All rights reserved.
//

#import "DemoTest.h"
#import "CRDynamicLoader.h"

char * LEVEL_A = "LEVEL_A";
char * LEVEL_B = "LEVEL_B";
char * LEVEL_C = "LEVEL_C";

CRDYML_FUNCTIONS_EXPORT(LEVEL_A){
    NSLog(@"LEVEL_A launch");
};

CRDYML_FUNCTIONS_EXPORT(LEVEL_B){
    NSLog(@"LEVEL_B launch");
};

CRDYML_FUNCTIONS_EXPORT(LEVEL_C){
    NSLog(@"LEVEL_C launch");
};
