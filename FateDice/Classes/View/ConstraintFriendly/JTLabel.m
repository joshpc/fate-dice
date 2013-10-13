//
//  JTLabel.m
//  FateDice
//
//  Created by Joshua Tessier on 2013-10-13.
//  Copyright (c) 2013 Joshua Tessier. All rights reserved.
//

#import "JTLabel.h"

@implementation JTLabel

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		[self setTranslatesAutoresizingMaskIntoConstraints:NO];
		[self setTextColor:[UIColor whiteColor]];
	}
	return self;
}

@end
