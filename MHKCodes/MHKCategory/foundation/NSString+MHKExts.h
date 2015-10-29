//
//  NSString+MHKExts.h
//  MHKCodes
//
//  Created by heke on 15/10/28.
//  Copyright (c) 2015年 mhk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MHKExts)

+ (NSDictionary *)dictionaryWithJsonString: (NSString *)JsonString;

- (NSString *)encodeToPercentEscapeString: (NSString *)input;
- (NSString *)decodeFromPercentEscapeString: (NSString *)input;

/*
 支持数据长度:无限
 */
- (NSString *)md5;
/*
 支持数据长度:<=2^64-1
 */
- (NSString *)sha1;

- (NSString *)base64Encode;
- (NSString *)base64Decode;

@end
