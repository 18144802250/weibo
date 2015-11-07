//
//  WRTextView.m
//  BaseProject
//
//  Created by apple-jd28 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "WRTextView.h"

@interface WRTextView ()

@property (nonatomic, weak) UILabel *placeHolderLB;


@end

@implementation WRTextView

- (UILabel *)placeHolderLB {
    if(_placeHolderLB == nil) {
        UILabel *label = [[UILabel alloc] init];
        
        [self addSubview:label];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(8);
            make.left.mas_equalTo(5);
        }];
        
        _placeHolderLB = label;
    }
    return _placeHolderLB;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.font = [UIFont systemFontOfSize:13];
        
    }
    return self;
}

- (void)setFont:(UIFont *)font
{
    [super setFont:font];
    
    [self.placeHolderLB setFont:font];
    
    [self.placeHolderLB sizeToFit];
}

- (void)setPlaceHolder:(NSString *)placeHolder
{
    _placeHolder = placeHolder;
    
    self.placeHolderLB.text = placeHolder;
    
    [self.placeHolderLB sizeToFit];
}

- (void)setHidePlaceHolder:(BOOL)hidePlaceHolder
{
    _hidePlaceHolder = hidePlaceHolder;
    self.placeHolderLB.hidden = hidePlaceHolder;
}

@end
