//
//  FFLimitTextView.m
//  FFCustomViews_Example
//
//  Created by 肖凡 on 2019/4/25.
//  Copyright © 2019年 fanxiaoApple. All rights reserved.
//

#import "FFLimitTextView.h"

@interface FFLimitTextView ()<UITextViewDelegate>
@property (nonatomic, weak) UITextView *textView;
@property (nonatomic, weak) UILabel *holderLbl;
@property (nonatomic, weak) UILabel *countLbl;
/**textView constraint array*/
@property (nonatomic, strong) NSArray *textViewConstArray;
@end

@implementation FFLimitTextView
//-(void)awakeFromNib{
//    [super awakeFromNib];
//
//    [self commonInit];
//}
- (id)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        [self commonInit];
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
    
}
#pragma mark - commonInit
- (void) commonInit {
    self.MaxLimit = 1000;
    self.showCount = YES;
    //placeholder
    UILabel *holderLbl = [UILabel new];
    holderLbl.text = @"写点什么吧...";
    holderLbl.font = [UIFont systemFontOfSize:14];
    holderLbl.layer.zPosition = 999;
    holderLbl.textColor = [UIColor colorWithRed:185/255.0 green:185/255.0 blue:185/255.0 alpha:1.0f];
    [self addSubview:holderLbl];
    self.holderLbl = holderLbl;
    
    // textView
    UITextView *textView = [UITextView new];
    textView.showsHorizontalScrollIndicator = NO;
    textView.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0f];
    textView.contentInset = UIEdgeInsetsMake(0, 4, 0, 0);
    textView.font = [UIFont systemFontOfSize:14];
    textView.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0f];
    textView.delegate = self;
    [self insertSubview:textView aboveSubview:holderLbl];
    self.textView = textView;
    
    //count
    UILabel *countLbl = [UILabel new];
    countLbl.text = @"0/1000";
    countLbl.font = [UIFont systemFontOfSize:12];
    countLbl.textColor = [UIColor colorWithRed:125/255.0 green:125/255.0 blue:125/255.0 alpha:1.0f];
    [self addSubview:countLbl];
    self.countLbl = countLbl;
    

    // holder constraint
    holderLbl.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *holderConstTop = [NSLayoutConstraint constraintWithItem:holderLbl attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationLessThanOrEqual toItem:textView attribute:NSLayoutAttributeTop multiplier:1.0 constant:7];
    NSLayoutConstraint *holderConstLeft = [NSLayoutConstraint constraintWithItem:holderLbl attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationLessThanOrEqual toItem:textView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:9];
    [self addConstraints:@[holderConstTop,holderConstLeft]];

    // textView constraint
    textView.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *textViewConstTop = [NSLayoutConstraint constraintWithItem:textView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:5];
    NSLayoutConstraint *textViewConstLeft = [NSLayoutConstraint constraintWithItem:textView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:5];
    NSLayoutConstraint *textViewConstBottom = [NSLayoutConstraint constraintWithItem:textView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-25];
    NSLayoutConstraint *textViewConstRight = [NSLayoutConstraint constraintWithItem:textView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:-5];
    [self addConstraints:@[textViewConstTop,textViewConstLeft,textViewConstBottom,textViewConstRight]];
    
    self.textViewConstArray = @[textViewConstTop,textViewConstLeft,textViewConstBottom,textViewConstRight];

    //countLbl constraint
    countLbl.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *countLblConstRight = [NSLayoutConstraint constraintWithItem:countLbl attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:textView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-7];
    NSLayoutConstraint *countLblConstBottom = [NSLayoutConstraint constraintWithItem:countLbl attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-6];
    [self addConstraints:@[countLblConstRight,countLblConstBottom]];
    
}
#pragma mark - setter
-(void)setPlaceholder:(NSString *)placeholder{
    _placeholder = placeholder;
    
    self.holderLbl.text = placeholder;
}
-(void)setPlaceholderColor:(UIColor *)placeholderColor{
    _placeholderColor = placeholderColor;
    
    self.holderLbl.textColor = placeholderColor;
}
-(void)setFontSize:(CGFloat)fontSize {
    _fontSize = fontSize;
    
    self.holderLbl.font = [UIFont systemFontOfSize:fontSize];
    self.textView.font = [UIFont systemFontOfSize:fontSize];
}
-(void)setMaxLimit:(int)MaxLimit{
    if (MaxLimit < 0) {
        return;
    }
    _MaxLimit = MaxLimit;
    if (self.countType == FFLimitTextViewCountTypeDefault) {
        self.countLbl.text = [NSString stringWithFormat:@"0/%d",MaxLimit];
    }else{
        self.countLbl.text = [NSString stringWithFormat:@"%d",self.MaxLimit];
    }
}
-(void)setCountType:(FFLimitTextViewCountType)countType{
    _countType = countType;
    
    [self setMaxLimit:self.MaxLimit];
}
-(void)setCountLabelTextColor:(UIColor *)countLabelTextColor {
    _countLabelTextColor = countLabelTextColor;
    
    self.countLbl.textColor = countLabelTextColor;
}
-(void)setCountLabelFontSize:(CGFloat)countLabelFontSize {
    _countLabelFontSize = countLabelFontSize;
    
    self.countLbl.font = [UIFont systemFontOfSize:countLabelFontSize];
}
-(void)setTintColor:(UIColor *)tintColor{
    _tintColor = tintColor;
    
    self.textView.tintColor = tintColor;
}
-(void)setTextViewBackgroundColor:(UIColor *)textViewBackgroundColor{
    _textViewBackgroundColor = textViewBackgroundColor;
    
    self.textView.backgroundColor = textViewBackgroundColor;
}
-(void)setTextViewCornerRadius:(CGFloat)textViewCornerRadius {
    _textViewCornerRadius = textViewCornerRadius;
    
    self.textView.layer.cornerRadius = textViewCornerRadius;
    self.textView.clipsToBounds = YES;
}
-(void)setTextViewBorderColor:(UIColor *)textViewBorderColor {
    _textViewBorderColor = textViewBorderColor;
    
    self.textView.layer.borderWidth = 1;
    self.textView.layer.borderColor = textViewBorderColor.CGColor;
}
-(void)setTextColor:(UIColor *)textColor{
    _textColor = textColor;
    
    self.textView.textColor = textColor;
}
-(void)setShowCount:(BOOL)showCount{
    _showCount = showCount;
    
    self.countLbl.hidden = !showCount;
}
-(void)setTextViewInset:(UIEdgeInsets)textViewInset{
    _textViewInset = textViewInset;
    
    [self removeConstraints:self.textViewConstArray];
    self.textView.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *textViewConstTop = [NSLayoutConstraint constraintWithItem:self.textView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:textViewInset.top];
    NSLayoutConstraint *textViewConstLeft = [NSLayoutConstraint constraintWithItem:self.textView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:textViewInset.left];
    NSLayoutConstraint *textViewConstBottom = [NSLayoutConstraint constraintWithItem:self.textView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-25];
    NSLayoutConstraint *textViewConstRight = [NSLayoutConstraint constraintWithItem:self.textView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:textViewInset.right];

    [self addConstraints:@[textViewConstTop,textViewConstLeft,textViewConstBottom,textViewConstRight]];
    [self updateConstraints];
}
#pragma mark - getter
-(NSString *)contentText{
    return self.textView.text;
}
#pragma mark - UITextViewDelegate
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range
 replacementText:(NSString *)text
{
    UITextRange *selectedRange = [textView markedTextRange];
    //获取高亮部分
    UITextPosition *pos = [textView positionFromPosition:selectedRange.start offset:0];
    //获取高亮部分内容
    //NSString * selectedtext = [textView textInRange:selectedRange];
    
    //如果有高亮且当前字数开始位置小于最大限制时允许输入
    if (selectedRange && pos) {
        NSInteger startOffset = [textView offsetFromPosition:textView.beginningOfDocument toPosition:selectedRange.start];
        NSInteger endOffset = [textView offsetFromPosition:textView.beginningOfDocument toPosition:selectedRange.end];
        NSRange offsetRange = NSMakeRange(startOffset, endOffset - startOffset);
        if (offsetRange.location < self.MaxLimit) {
            return YES;
        }else {
            return NO;
        }
    }
    NSString *comcatstr = [textView.text stringByReplacingCharactersInRange:range withString:text];
    NSInteger caninputlen = self.MaxLimit - comcatstr.length;
    if (caninputlen >= 0)
    {
        return YES;
    }else{
        NSInteger len = text.length + caninputlen;
        //防止当text.length + caninputlen < 0时，使得rg.length为一个非法最大正数出错
        NSRange rg = {0,MAX(len,0)};
        
        if (rg.length > 0)
        {
            NSString *s = @"";
            //判断是否只普通的字符或asc码(对于中文和表情返回NO)
            BOOL asc = [text canBeConvertedToEncoding:NSASCIIStringEncoding];
            if (asc) {
                s = [text substringWithRange:rg];//因为是ascii码直接取就可以了不会错
            }else {
                __block NSInteger idx = 0;
                __block NSString  *trimString = @"";//截取出的字串
                //使用字符串遍历，这个方法能准确知道每个emoji是占一个unicode还是两个
                [text enumerateSubstringsInRange:NSMakeRange(0, [text length])
                                         options:NSStringEnumerationByComposedCharacterSequences
                                      usingBlock: ^(NSString* substring, NSRange substringRange, NSRange enclosingRange, BOOL* stop) {
                                          
                                          if (idx >= rg.length) {
                                              *stop = YES; //取出所需要就break，提高效率
                                              return ;
                                          }
                                          trimString = [trimString stringByAppendingString:substring];
                                          idx++;
                }];
                s = trimString;
            }
            //rang是指从当前光标处进行替换处理(注意如果执行此句后面返回的是YES会触发didchange事件)
            [textView setText:[textView.text stringByReplacingCharactersInRange:range withString:s]];
            //既然是超出部分截取了，哪一定是最大限制了。
            if (self.countType == FFLimitTextViewCountTypeDefault) {
                self.countLbl.text = [NSString stringWithFormat:@"%ld/%ld",(long)self.MaxLimit,(long)self.MaxLimit];
            }else{
                self.countLbl.text = @"0";
            }
        }
        return NO;
    }
}
- (void)textViewDidChange:(UITextView *)textView
{
    UITextRange *selectedRange = [textView markedTextRange];
    //获取高亮部分
    UITextPosition *pos = [textView positionFromPosition:selectedRange.start offset:0];
    
    //如果在变化中是高亮部分在变，就不要计算字符了
    if (selectedRange && pos) {
        self.holderLbl.hidden = YES;
        return;
    }
    NSString  *nsTextContent = textView.text;
    NSInteger existTextNum = nsTextContent.length;
    if (existTextNum > self.MaxLimit)
    {
        //截取到最大位置的字符(由于超出截部分在should时被处理了所在这里这了提高效率不再判断)
        NSString *s = [nsTextContent substringToIndex:self.MaxLimit];
        [textView setText:s];
    }
    //不让显示负数
    if (self.countType == FFLimitTextViewCountTypeDefault) {
        self.countLbl.text = [NSString stringWithFormat:@"%ld/%d",self.MaxLimit-MAX(0,self.MaxLimit - existTextNum),self.MaxLimit];
    }else{
        self.countLbl.text = [NSString stringWithFormat:@"%ld",MAX(0,self.MaxLimit - existTextNum)];
    }
    self.holderLbl.hidden = existTextNum > 0;
}
@end
/*
 //    [holderLbl mas_makeConstraints:^(MASConstraintMaker *make) {
 //        make.top.equalTo(textView.mas_top).offset(7);
 //        make.left.equalTo(textView.mas_left).offset(9);
 //    }];
 //    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
 //        make.top.equalTo(self.mas_top).offset(5);
 //        make.left.equalTo(self.mas_left).offset(5);
 //        make.bottom.equalTo(self.mas_bottom).offset(-25);
 //        make.right.equalTo(self.mas_right).offset(-5);
 //    }];
 //    [countLbl mas_makeConstraints:^(MASConstraintMaker *make) {
 //        make.right.equalTo(textView.mas_right).offset(-7);
 //        make.bottom.equalTo(self.mas_bottom).offset(-6);
 //    }];
 */
