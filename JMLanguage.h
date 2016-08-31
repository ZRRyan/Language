//
//  JMLanguage.h
//  JetMaster
//
//  Created by Ryan on 16/8/5.
//  Copyright © 2016年 monkey. All rights reserved.
//

#import <Foundation/Foundation.h>

#define CHINESE @"zh-Hans" // 中文简体
#define ENGLISH @"en" // 英文

// 宏调用国际化
#define JML(key) [[JMLanguage bundle] localizedStringForKey:key value:nil table:@"InfoPlist"]

// 用来注册通知的宏
#define ChangeLanguage @"changeLanguage"

@interface JMLanguage : NSObject
/**
 *  获取当前资源文件
 */
+ ( NSBundle * )bundle;

/**
 *  初始化语言
 */
+ (void)initLanguage;

/**
 *  获取当前应用的语言版本
 *
 *  @return 当前语言
 */
+ (NSString *)userLanguage;

+ (void)setUserLanguage: (NSString *)language;
@end
