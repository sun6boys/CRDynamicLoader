//
//  CRDynamicLoader.m
//  CRDynamicLoader
//
//  Created by Charon on 2018/12/22.
//  Copyright © 2018年 Charon. All rights reserved.
//

#import "CRDynamicLoader.h"
#include <mach-o/getsect.h>
#include <mach-o/loader.h>
#include <mach-o/dyld.h>
#include <dlfcn.h>


static void CRDynamicLoader_invoke_method(void *key){
    Dl_info info;
    int ret = dladdr(CRDynamicLoader_invoke_method, &info);
    if(ret == 0){
        // fatal error
    }
#ifndef __LP64__
    const struct mach_header *mhp = (struct mach_header*)info.dli_fbase;
    unsigned long size = 0;
    uint32_t *memory = (uint32_t*)getsectiondata(mhp, QWLoadableSegmentName, QWLoadableSectionName, & size);
#else /* defined(__LP64__) */
    const struct mach_header_64 *mhp = (struct mach_header_64*)info.dli_fbase;
    unsigned long size = 0;
    uint64_t *memory = (uint64_t*)getsectiondata(mhp, CRDYML_SEGMENTNAME, key, &size);
#endif /* defined(__LP64__) */
    
    for(int idx = 0; idx < size/sizeof(void*); ++idx){
        CRDynamicLoaderInjectFunction func = (CRDynamicLoaderInjectFunction)memory[idx];
        func(); //crash tofix
    }
}


@implementation CRDynamicLoader

+ (void)executeFunctionsForKey:(char *)key
{
    CRDynamicLoader_invoke_method(key);
}

@end
