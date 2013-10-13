//
//  JTRollView.m
//  FateDice
//
//  Created by Joshua Tessier on 2013-10-13.
//  Copyright (c) 2013 Joshua Tessier. All rights reserved.
//

#import "JTRollView.h"

//Views
#import "JTDiceBoardView.h"
#import "JTLabel.h"
#import "JTButton.h"

@implementation JTRollView {
	UILabel *_rollTotalLabel;
	JTDiceBoardView *_diceRollView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		[self setBackgroundColor:[UIColor blackColor]];
		
		_diceRollView = [[JTDiceBoardView alloc] initWithFrame:CGRectZero];
		
		_rollTotalLabel = [[JTLabel alloc] initWithFrame:CGRectZero];
		_rollTotalLabel.font = [UIFont diceFontWithSize:kJTSmallFontSize];
		_rollTotalLabel.text = @"Result";
		_rollTotalLabel.textAlignment = NSTextAlignmentCenter;
		
		_totalLabel = [[JTLabel alloc] initWithFrame:CGRectZero];
		_totalLabel.font = [UIFont diceFontWithSize:kJTExtraLargeFontSize];
		_totalLabel.text = @"0";
		_totalLabel.textAlignment = NSTextAlignmentCenter;
		
		_rollButton = [[JTButton alloc] initWithFrame:CGRectZero];
		_rollButton.titleLabel.font = [UIFont diceFontWithSize:kJTMediumFontSize];
		[_rollButton setTitle:@"Roll Dice" forState:UIControlStateNormal];
		
		[self addSubview:_diceRollView];
		[self addSubview:_rollTotalLabel];
		[self addSubview:_totalLabel];
		[self addSubview:_rollButton];
		[self applyLayoutConstraints];
	}
	return self;
}

- (void)applyLayoutConstraints
{
	NSDictionary *metrics = @{ @"padding" : @(kJTViewPadding), @"buttonHeight" : @(kJTButtonHeight) };
	NSDictionary *views = NSDictionaryOfVariableBindings(_diceRollView, _totalLabel, _rollButton, _rollTotalLabel);
	[self addConstraintsWithVisualFormat:@"H:|-(padding)-[_diceRollView]-(padding)-|" metrics:metrics views:views];
	[self addConstraintsWithVisualFormat:@"H:|-(padding)-[_rollTotalLabel]-(padding)-|" metrics:metrics views:views];
	[self addConstraintsWithVisualFormat:@"H:|-(padding)-[_totalLabel]-(padding)-|" metrics:metrics views:views];
	[self addConstraintsWithVisualFormat:@"H:|-(padding)-[_rollButton]-(padding)-|" metrics:metrics views:views];
	[self addConstraintsWithVisualFormat:@"V:|[_diceRollView]-(padding)-[_rollTotalLabel]-(-20)-[_totalLabel]-(padding)-[_rollButton(buttonHeight)]-(padding)-|" metrics:metrics views:views];
}

- (void)showDiceWithRolls:(NSArray*)diceRolls
{
	[_diceRollView showDiceWithRolls:diceRolls];
}

@end
