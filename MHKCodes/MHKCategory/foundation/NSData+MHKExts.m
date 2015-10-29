//
//  NSData+MHKExts.m
//  MHKCodes
//
//  Created by heke on 15/10/29.
//  Copyright (c) 2015年 mhk. All rights reserved.
//

#import "NSData+MHKExts.h"

@implementation NSData (MHKExts)

- (NSData *)base64Encode{
    NSData *base64Data = [self base64EncodedDataWithOptions:0];
    return base64Data;
}

- (NSData *)base64Decode{
    NSData *nsdataDecoded = [[NSData alloc] initWithBase64EncodedData:self options:0];
    return nsdataDecoded;
}

@end

/*
 Base64:
 Base64编码要求把3个8位字节（3*8=24）转化为4个6位的字节（4*6=24），之后在6位的前面补两个0，形成8位一个字节的形式。 
 如果剩下的字符不足3个字节，则用0填充，输出字符使用'='，因此编码后输出的文本末尾可能会出现1或2个'='
 */