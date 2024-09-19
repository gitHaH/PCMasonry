//
//  ZMA.m
//  CYTest
//
//  Created by 张萌 on 2024/9/2.
//

#import "ZMA.h"

ZMA *share;
@implementation ZMA
+ (instancetype) shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        share = [[ZMA alloc] init];
    });
    return share;
}

- (void)test{
    NSString *a = @"abc";
    NSString *b = [share.delegate dealString:a];
    NSLog(@"%@",b);
}



@end
