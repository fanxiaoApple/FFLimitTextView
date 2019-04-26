//
//  UIBarButtonItem+FFAdd.h
//  FFKit_Example
//
//  Created by 肖凡 on 2019/3/21.
//  Copyright © 2019年 fanxiaoApple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIBarButtonItem (FFAdd)
@property (nullable, nonatomic, copy) void (^actionBlock)(id);
@end

NS_ASSUME_NONNULL_END
