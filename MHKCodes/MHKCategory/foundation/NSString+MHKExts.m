//
//  NSString+MHKExts.m
//  MHKCodes
//
//  Created by heke on 15/10/28.
//  Copyright (c) 2015年 mhk. All rights reserved.
//

#import "NSString+MHKExts.h"
#include <CommonCrypto/CommonDigest.h>

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
- (NSString *)encodeToPercentEscapeString: (NSString *) input{
    NSString*
    outputStr = (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes(NULL, /* allocator */
                                                                             (__bridge CFStringRef)input,
                                                                             NULL, /* charactersToLeaveUnescaped */
                                                                             (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                                             kCFStringEncodingUTF8);
    
    
    return
    outputStr;
}
- (NSString *)decodeFromPercentEscapeString: (NSString *) input{
    NSMutableString *outputStr = [NSMutableString stringWithString:input];
    [outputStr replaceOccurrencesOfString:@"+"
                               withString:@" "
                                  options:NSLiteralSearch
                                    range:NSMakeRange(0,
                                                      [outputStr length])];
    
    return
    [outputStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

- (NSString *)subStringMatchPattern:(NSString *)pattern andTemplate:(NSString *)regexTemplate{
    NSAssert([pattern length]>0 && [regexTemplate length]>0, @"param error");
    
    NSRegularExpression *regex =[NSRegularExpression regularExpressionWithPattern:pattern options:0 error:nil];
    return [regex stringByReplacingMatchesInString:self
                                           options:0
                                             range:NSMakeRange(0, [self length])
                                      withTemplate:regexTemplate];
}

- (NSString *)md5{
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), result ); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10],result[11],
            result[12],result[13],result[14],result[15]
            ];
}

- (NSString *)sha1{
    const char *cstr = [self UTF8String];
    //使用对应的CC_SHA1,CC_SHA256,CC_SHA384,CC_SHA512的长度分别是20,32,48,64
    unsigned char digest[CC_SHA1_DIGEST_LENGTH];
    //使用对应的CC_SHA256,CC_SHA384,CC_SHA512
    CC_SHA1(cstr,  (CC_LONG)strlen(cstr), digest);
    NSMutableString* result = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++) {
        [result appendFormat:@"%02x", digest[i]];
    }
    return result;
}

//见：GTMBase64
- (NSString *)base64Encode{
    NSData* originData = [self dataUsingEncoding:NSASCIIStringEncoding];
    
    NSString* encodeResult = [originData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    
    NSLog(@"encodeResult:%@",encodeResult);
    return encodeResult;
}

- (NSString *)base64Decode{
    NSData* decodeData = [[NSData alloc] initWithBase64EncodedString:self options:0];
    
    NSString* decodeStr = [[NSString alloc] initWithData:decodeData encoding:NSASCIIStringEncoding];
    NSLog(@"decodeResult:%@",decodeStr);
    return decodeStr;
}

@end
