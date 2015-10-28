//
//  NSString+MHKExts.h
//  MHKCodes
//
//  Created by heke on 15/10/28.
//  Copyright (c) 2015年 mhk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MHKExts)

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)JsonString;

- (NSString *)encodeToPercentEscapeString: (NSString *) input;
- (NSString *)decodeFromPercentEscapeString: (NSString *) input;

@end
