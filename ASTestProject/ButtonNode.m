//
//  ButtonNode.m
//
//  Created by Andy LaVoy on 12/11/14.
//  Copyright (c) 2015 Andy LaVoy. All rights reserved.
//

#import "ButtonNode.h"
#import "ASControlNode.h"
#import "ASDisplayNode+Subclasses.h"

const CGFloat ButtonHeightIdeal = 44.0;
const CGFloat ButtonCornerRadius = 6.0;

@implementation ButtonNode

+ (instancetype)buttonWithTitle:(NSString *)title {
    ButtonNode *buttonNode = [[[self class] alloc] init];
    
    if (buttonNode) {
        [buttonNode setTitleString:title];
        
        buttonNode.highlighted = NO;
    }
    
    return buttonNode;
}

- (instancetype)init {
    if (self = [super init]) {
        self.userInteractionEnabled = YES;
    }
    
    return self;
}

- (void)didLoad {
    [super didLoad];
    
    self.layer.cornerRadius = ButtonCornerRadius;
    self.layer.masksToBounds = YES;
    
    [self setHighlighted:NO];
}

- (CGSize)calculateSizeThatFits:(CGSize)constrainedSize {
    return CGSizeMake(constrainedSize.width, ButtonHeightIdeal);
}

- (void)setHighlighted:(BOOL)highlighted {
    UIColor *backgroundColor;
    UIColor *textColor;
    
    if (highlighted) {
        textColor = [UIColor blackColor];
        backgroundColor = [UIColor lightGrayColor];
    } else {
        textColor = [UIColor whiteColor];
        backgroundColor = [UIColor darkGrayColor];
    }
    
    self.backgroundColor = backgroundColor;
    [self setTitleTextColor:textColor];
}

#pragma mark - Public

- (void)setTitleString:(NSString *)titleString {
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineBreakMode = NSLineBreakByTruncatingTail;
    style.alignment = NSTextAlignmentCenter;
    style.minimumLineHeight = 33.0;
    
    NSDictionary *attrs = @{
                            NSFontAttributeName : [UIFont fontWithName:@"AvenirNext-Bold" size:16.0],
                            NSParagraphStyleAttributeName : style,
                            };
    
    self.attributedString = [[NSAttributedString alloc] initWithString:titleString attributes:attrs];
}

- (void)setTitleTextColor:(UIColor *)color {
    NSMutableAttributedString *titleString = [self.attributedString mutableCopy];
    
    NSRange fullRange = NSMakeRange(0, [titleString length]);
    [titleString addAttribute:NSForegroundColorAttributeName value:color range:fullRange];
    [titleString addAttribute:NSBackgroundColorAttributeName value:[UIColor clearColor] range:fullRange];
    
    self.attributedString = titleString;
}

@end
