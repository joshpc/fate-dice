//
//  JTDiceBoardView.m
//  FateDice
//
//  Created by Joshua Tessier on 2013-10-13.
//  Copyright (c) 2013 Joshua Tessier. All rights reserved.
//

#import "JTDiceBoardView.h"
#import "JTDiceView.h"

#define kJTMaxRotation 15

@implementation JTDiceBoardView {
	NSArray *_diceRollViews;
}

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		[self setTranslatesAutoresizingMaskIntoConstraints:NO];
	}
	return self;
}


- (CGSize)diceSizeForRowCount:(NSUInteger)numberOfRows
{
	CGRect bounds = self.bounds;
	CGFloat maxDiceHeight = roundf((bounds.size.height - (2 - (numberOfRows - 1)) * kJTViewPadding) / numberOfRows);
	CGFloat maxDiceWidth = roundf((bounds.size.width - 3 * kJTViewPadding) / 3.0f);
	CGFloat widthHeight = MIN(maxDiceHeight, maxDiceWidth);
	return CGSizeMake(widthHeight, widthHeight);
}

- (NSMutableArray*)createDiceRollViewsFromRolls:(NSArray*)diceRolls
{
	CGRect bounds = self.bounds;
	NSMutableArray *diceRollViews = [[NSMutableArray alloc] init];
	NSUInteger numberOfRows = (NSUInteger)ceilf((CGFloat)[diceRolls count] / (CGFloat)kJTMaxDicePerRow);
	if (numberOfRows > 0) {
		CGSize diceSize = [self diceSizeForRowCount:numberOfRows];
		CGFloat horizontalPadding = roundf((bounds.size.width - 2 * kJTViewPadding - kJTMaxDicePerRow * diceSize.width) / (kJTMaxDicePerRow + 1));
		CGFloat verticalPadding = roundf((bounds.size.height - 2 * kJTViewPadding - numberOfRows * diceSize.height) / (numberOfRows + 1));
		CGFloat baseXOffset = bounds.origin.x + bounds.size.width + kJTViewPadding + horizontalPadding;
		CGFloat baseYOffset = bounds.origin.y + kJTViewPadding + verticalPadding;
		for (NSInteger i = 0; i < [diceRolls count]; ++i) {
			NSNumber *diceRoll = diceRolls[i];
			NSUInteger row = i / kJTMaxDicePerRow;
			NSUInteger column = i % kJTMaxDicePerRow;
			
			JTDiceView *diceView = [[JTDiceView alloc] initWithFrame:CGRectMake(baseXOffset + column * (diceSize.width + horizontalPadding) + arc4random() % (NSUInteger)(horizontalPadding/2),
																				baseYOffset + row * (diceSize.height + verticalPadding) + arc4random() % (NSUInteger)(verticalPadding/2),
																				diceSize.width, diceSize.height) roll:[diceRoll integerValue]];
			
			[diceRollViews addObject:diceView];
			[self addSubview:diceView];
		}
	}
	return diceRollViews;
}

- (void)showDiceWithRolls:(NSArray*)diceRolls
{
	NSArray *oldRolls = _diceRollViews;
	NSArray *diceRollViews = [self createDiceRollViewsFromRolls:diceRolls];
	_diceRollViews = diceRollViews;
	
	[UIView animateWithDuration:kJTAverageAnimationDuration delay:0.0f options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionBeginFromCurrentState animations:^{
		for (UIView *view in oldRolls) {
			view.frame = CGRectOffset(view.frame, -self.bounds.size.width, 0.0f);
			view.transform = CGAffineTransformIdentity;
		}
		
		for (UIView *view in diceRollViews) {
			view.frame = CGRectOffset(view.frame, -self.bounds.size.width, 0.0f);
			CGFloat targetDegrees = arc4random() % 360;
			view.transform = CGAffineTransformMakeRotation(((targetDegrees - 180.0f) / 180.0f) * M_2_PI);
		}
	} completion:^(BOOL finished) {
		for (UIView *view in oldRolls) {
			[view removeFromSuperview];
		}
	}];
}

@end
