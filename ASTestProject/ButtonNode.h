//
//  ButtonNode.h
//
//  Created by Andy LaVoy on 12/11/14.
//  Copyright (c) 2015 Andy LaVoy. All rights reserved.
//

#import "ASTextNode.h"

extern const CGFloat ButtonHeightIdeal;
extern const CGFloat ButtonCornerRadius;

@interface ButtonNode : ASTextNode

+ (instancetype)buttonWithTitle:(NSString *)title;

@end
