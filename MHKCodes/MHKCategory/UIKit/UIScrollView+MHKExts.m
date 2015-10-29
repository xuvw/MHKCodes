//
//  UIScrollView+MHKExts.m
//  MHKCodes
//
//  Created by heke on 15/10/29.
//  Copyright (c) 2015年 mhk. All rights reserved.
//

#import "UIScrollView+MHKExts.h"

@implementation UIScrollView (MHKExts)

- (void)stopScroll{
    [self setContentOffset:self.contentOffset animated:NO];
}

@end
