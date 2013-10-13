//
//  JTDiceView.m
//  FateDice
//
//  Created by Joshua Tessier on 2013-10-13.
//  Copyright (c) 2013 Joshua Tessier. All rights reserved.
//

#import "JTDiceView.h"

@implementation JTDiceView {
	UIImageView *_face;
}

- (instancetype)initWithFrame:(CGRect)frame roll:(JTRoll)roll
{
	self = [super initWithFrame:frame];
	if (self) {
		_face = [[UIImageView alloc] initWithFrame:self.bounds];
		_face.image = [JTDiceView imageForDiceRoll:roll];
		_face.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
		self.layer.cornerRadius = kJTCornerRadius;
		self.backgroundColor = [UIColor colorWithRed:0.820 green:0.227 blue:0.220 alpha:1];
		[self addSubview:_face];
	}
	return self;
}

+ (UIImage*)imageForDiceRoll:(JTRoll)roll
{
	UIImage *image = nil;
	switch (roll) {
		case JTRollMinus:
			image = [UIImage imageNamed:@"minus"]; break;
		case JTRollPlus:
			image = [UIImage imageNamed:@"plus"]; break;
		default:
			image = nil; break;
	}
	return image;
}

- (void)layoutSubviews
{
	[super layoutSubviews];
	_face.frame = CGRectInset(self.bounds, kJTViewPadding, kJTViewPadding);
}

@end
