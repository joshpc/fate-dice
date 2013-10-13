//
//  JTButton.m
//  FateDice
//
//  Created by Joshua Tessier on 2013-10-13.
//  Copyright (c) 2013 Joshua Tessier. All rights reserved.
//

#import "JTButton.h"

@implementation JTButton {
	UIView *_backgroundView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		self.contentMode = UIViewContentModeRedraw;

		[self setTranslatesAutoresizingMaskIntoConstraints:NO];
		[self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
		
		_backgroundView = [[UIView alloc] initWithFrame:self.bounds];
		_backgroundView.layer.cornerRadius = kJTCornerRadius;
		_backgroundView.backgroundColor = [UIColor colorWithRed:0.302 green:0.302 blue:0.302 alpha:1];
		_backgroundView.userInteractionEnabled = NO;
		[self addSubview:_backgroundView];
	}
	return self;
}

- (void)setHighlighted:(BOOL)highlighted
{
	[super setHighlighted:highlighted];
	
	[UIView animateWithDuration:kJTShortAnimationDuration delay:0.0f options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionAllowUserInteraction animations:^{
		_backgroundView.backgroundColor = highlighted ? [UIColor grayColor] : [UIColor colorWithRed:0.302 green:0.302 blue:0.302 alpha:1];
	} completion:nil];
}

- (void)layoutSubviews
{
	[super layoutSubviews];
	_backgroundView.frame = self.bounds;
}

@end
