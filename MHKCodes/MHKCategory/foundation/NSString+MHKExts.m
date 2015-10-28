//
//  NSString+MHKExts.m
//  MHKCodes
//
//  Created by heke on 15/10/28.
//  Copyright (c) 2015年 mhk. All rights reserved.
//

#import "NSString+MHKExts.h"

@implementation NSString (MHKExts)

/*
 options取值解释：
 0                                           :解析结果inMutable
 NSJSONReadingMutableContainers = (1UL << 0),:解析结果mutable
 NSJSONReadingMutableLeaves = (1UL << 1),    :Json解析结果中字符串为mutable
 NSJSONReadingAllowFragments = (1UL << 2)    :原始Json可以是非对象或数组
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)JsonString {
    if ([JsonString length]<1) {
        return nil;
    }
    
    NSData *jsonData = [JsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *JsonDic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                            options:NSJSONReadingMutableContainers
                                                              error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return JsonDic;
}

/*
 不会处理URL中的保留字，见：GTMNSString+URLArguments
 [string stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
 [string stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
 */
- (NSString *)encodeToPercentEscapeString: (NSString *) input
{
    NSString*
    outputStr = (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes(NULL, /* allocator */
                                                                             (__bridge CFStringRef)input,
                                                                             NULL, /* charactersToLeaveUnescaped */
                                                                             (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                                             kCFStringEncodingUTF8);
    
    
    return
    outputStr;
}
- (NSString *)decodeFromPercentEscapeString: (NSString *) input
{
    NSMutableString *outputStr = [NSMutableString stringWithString:input];
    [outputStr replaceOccurrencesOfString:@"+"
                               withString:@" "
                                  options:NSLiteralSearch
                                    range:NSMakeRange(0,
                                                      [outputStr length])];
    
    return
    [outputStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

@end
