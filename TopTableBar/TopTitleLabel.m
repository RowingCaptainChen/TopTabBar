//
//  TopTitleLabel.m
//  TopTableBar
//
//  Created by chenshuai on 17/8/3.
//  Copyright © 2017年 chenshuai. All rights reserved.
//

#import "TopTitleLabel.h"

@implementation TopTitleLabel
- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        self.font = [UIFont systemFontOfSize:16];
        self.textColor = [UIColor blueColor];
        self.textAlignment = NSTextAlignmentCenter;
        self.backgroundColor = [UIColor yellowColor];
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (void)setScale:(CGFloat)scale {
    _scale = scale;
    self.textColor = [UIColor blueColor];
    CGFloat transformScale = 1 + scale * 0.3;
    self.transform = CGAffineTransformMakeScale(transformScale, transformScale);
}
@end
