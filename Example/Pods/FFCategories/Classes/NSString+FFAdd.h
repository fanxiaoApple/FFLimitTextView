//
//  NSString+FFAdd.h
//  FFKit_Example
//
//  Created by 肖凡 on 2019/3/21.
//  Copyright © 2019年 fanxiaoApple. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (FFAdd)
- (nullable NSString *)md5String;
- (NSString *)stringByTrim;
- (BOOL)isNotBlank;
- (BOOL)containsString:(NSString *)string;
- (NSData *)dataValue;
- (CGFloat)widthForFont:(UIFont *)font;
- (CGFloat)heightForFont:(UIFont *)font width:(CGFloat)width;
@end

NS_ASSUME_NONNULL_END
