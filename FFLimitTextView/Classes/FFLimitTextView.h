//
//  FFLimitTextView.h
//  FFCustomViews_Example
//
//  Created by 肖凡 on 2019/4/25.
//  Copyright © 2019年 fanxiaoApple. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    FFLimitTextViewCountTypeDefault,
    FFLimitTextViewCountTypeLeft,
} FFLimitTextViewCountType;

@interface FFLimitTextView : UIView
/** 占位文字、输入文字大小 */
@property (nonatomic, assign) CGFloat fontSize;
/** 占位文字颜色 */
@property (nonatomic, strong) UIColor *placeholderColor;
/** 文字颜色 */
@property (nonatomic, strong) UIColor *textColor;
/** 占位文字 */
@property (nonatomic, copy) NSString *placeholder;
/** 计数文字颜色 */
@property (nonatomic, strong) UIColor *countLabelTextColor;
/** 计数文字大小 */
@property (nonatomic, assign) CGFloat countLabelFontSize;
/**光标颜色*/
@property (nonatomic, strong) UIColor *tintColor;
/**textView背景颜色*/
@property (nonatomic, strong) UIColor *textViewBackgroundColor;
/**textView圆角*/
@property (nonatomic, assign) CGFloat textViewCornerRadius;
/**textView边框颜色*/
@property (nonatomic, strong) UIColor *textViewBorderColor;
/** 最大输入字数 默认1000 */
@property (nonatomic, assign) int MaxLimit;
/** 计数类型 default：0/10 left:还能输入数 */
@property (nonatomic, assign) FFLimitTextViewCountType countType;
/**是否显示计数*/
@property (nonatomic, assign) BOOL showCount;
/**设置textView距离外部view的内边距，不要设置底部*/
@property (nonatomic, assign) UIEdgeInsets textViewInset;
/**输入的字符串*/
@property (nonatomic, copy, readonly) NSString *contentText;
@end

