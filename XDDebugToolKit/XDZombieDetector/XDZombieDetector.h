//
//  XDZombieDetector.h
//  XDDebugToolKitDev
//
//  Created by SuXinDe on 2018/6/10.
//  Copyright © 2018年 su xinde. All rights reserved.
//

#import <Foundation/Foundation.h>

// 修改自 LXDZombieSniffer

@interface XDZombieDetector : NSObject

+ (void)start;
+ (void)stop;
+ (void)addIgnoreClass:(Class)clazz;

@end

