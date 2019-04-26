//
//  UIView+FFAdd.h
//  FFKit_Example
//
//  Created by 肖凡 on 2019/3/21.
//  Copyright © 2019年 fanxiaoApple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (FFAdd)
@property (nonatomic, assign) CGFloat FF_Top;
@property (nonatomic, assign) CGFloat FF_Left;
@property (nonatomic, assign) CGFloat FF_Bottom;
@property (nonatomic, assign) CGFloat FF_Right;
@property (nonatomic, assign) CGFloat FF_Width;
@property (nonatomic, assign) CGFloat FF_Height;
@property (nonatomic, assign) CGFloat FF_CenterX;
@property (nonatomic, assign) CGFloat FF_CenterY;
@property (nonatomic, assign) CGPoint FF_Origin;
@property (nonatomic, assign) CGSize FF_Size;

@end

NS_ASSUME_NONNULL_END
