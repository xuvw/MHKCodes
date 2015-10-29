//
//  NSData+MHKExts.h
//  MHKCodes
//
//  Created by heke on 15/10/29.
//  Copyright (c) 2015年 mhk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (MHKExts)

- (NSData *)base64Encode;
- (NSData *)base64Decode;

@end
