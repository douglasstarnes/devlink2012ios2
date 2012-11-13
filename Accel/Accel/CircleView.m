//
//  CircleView.m
//  Accel
//
//  Created by DOUGLAS STARNES on 8/23/12.
//  Copyright (c) 2012 Douglas Starnes. All rights reserved.
//

#import "CircleView.h"

@implementation CircleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.opaque = NO;
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor greenColor].CGColor);
    CGContextFillEllipseInRect(context, CGRectMake(0.0, 0.0, 20.0, 20.0));
}


@end
