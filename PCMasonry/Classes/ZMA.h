//
//  ZMA.h
//  CYTest
//
//  Created by 张萌 on 2024/9/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ZMProtol <NSObject>

- (NSString *)dealString:(NSString *)oriString;

@end

@interface ZMA : NSObject

+ (instancetype) shareInstance ;

- (void)test;
@property(nonatomic,weak) id<ZMProtol> delegate;
@end

NS_ASSUME_NONNULL_END
