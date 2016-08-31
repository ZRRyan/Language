//
//  JMLanguage.m
//  JetMaster
//
//  Created by Ryan on 16/8/5.
//  Copyright © 2016年 monkey. All rights reserved.
//

#import "JMLanguage.h"

@implementation JMLanguage

//static NSBundle *bundle = nil;
//
//+ (NSBundle *)bundle {
//    if (bundle == nil) {
//        bundle = [NSBundle mainBundle];
//    }
//    return bundle;
//}

static NSBundle * bundle = nil;
+ ( NSBundle * )bundle {
    
    if (bundle == nil) {
        bundle = [NSBundle mainBundle];
    }
    
    return bundle;
}

/**
 *  获取当前应用的语言版本
 *
 *  @return 当前语言
 */
+ (NSString *)userLanguage {
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSString *language= [def objectForKey:@"userLanguage"];
    ZRLog(@"%@",language);
    NSString *currentLanguage = language;
    return currentLanguage;
}

// 初始化语言
+ (void)initLanguage {
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSString *currLanguage= [def objectForKey:@"userLanguage"];
    
    if (currLanguage == nil || [currLanguage isEqualToString:@""]) { // 本地语言不存在
        // 获取当前系统语言
        NSArray *sysLanguages = [def objectForKey:@"AppleLanguages"];
        NSString *sysLanguage = sysLanguages[0];
        if ([sysLanguage hasPrefix:CHINESE]) { // 判断字符串开始包换某个串
            currLanguage = CHINESE;
        } else {
            currLanguage = ENGLISH;
        }
        
        [[NSUserDefaults standardUserDefaults] setValue:currLanguage forKey:@"userLanguage"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    //获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:currLanguage ofType:@"lproj"];
    bundle = [NSBundle bundleWithPath:path];//生成bundle
}

+ (void)setUserLanguage: (NSString *)language {
    //1.第一步改变bundle的值
    NSString *path = [[NSBundle mainBundle] pathForResource:language ofType:@"lproj" ];
    bundle = [NSBundle bundleWithPath:path];
    
    // 2.持久化
    [[NSUserDefaults standardUserDefaults] setValue:language forKey:@"userLanguage"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
