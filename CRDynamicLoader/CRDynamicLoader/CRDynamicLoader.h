//
//  CRDynamicLoader.h
//  CRDynamicLoader
//
//  Created by Charon on 2018/12/22.
//  Copyright © 2018年 Charon. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (*CRDynamicLoaderInjectFunction)(void);

#define CRDYML_SEGMENTNAME "__DATA"
#define CRDYML_ATTRIBUTE(sectionName) __attribute((used, section(CRDYML_SEGMENTNAME "," #sectionName )))

#define CRDYML_FUNCTIONS_EXPORT_BEGIN(KEY) \
static void CRDYML_INJECT_##KEY##_FUNCTION(void){

#define CRDYML_FUNCTIONS_EXPORT_END(KEY) \
} \
static CRDynamicLoaderInjectFunction dymlLoader##KEY##Var CRDYML_ATTRIBUTE(KEY) = CRDYML_INJECT_##KEY##_FUNCTION;

@interface CRDynamicLoader : NSObject

+ (void)executeFunctionsForKey:(char *)key;
@end

