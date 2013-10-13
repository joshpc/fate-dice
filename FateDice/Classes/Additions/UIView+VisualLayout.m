//
//  UIView+VisualLayout.m
//  FateDice
//
//  Created by Joshua Tessier on 2013-10-13.
//  Copyright (c) 2013 Joshua Tessier. All rights reserved.
//

#import "UIView+VisualLayout.h"

@implementation UIView (VisualLayout)

- (void)addConstraintsWithVisualFormat:(NSString*)format metrics:(NSDictionary*)metrics views:(NSDictionary*)views
{
	[self addConstraintsWithVisualFormat:format options:0 metrics:metrics views:views];
}

- (void)addConstraintsWithVisualFormat:(NSString*)format options:(NSLayoutFormatOptions)options metrics:(NSDictionary*)metrics views:(NSDictionary*)views
{
	[self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:format options:options metrics:metrics views:views]];
}

@end
