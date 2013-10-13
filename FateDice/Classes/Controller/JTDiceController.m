//
//  JTDiceController.m
//  FateDice
//
//  Created by Joshua Tessier on 2013-10-13.
//  Copyright (c) 2013 Joshua Tessier. All rights reserved.
//

#import "JTDiceController.h"

//Views
#import "JTRollView.h"

//Model
#import "JTDiceRoll.h"

@implementation JTDiceController {
	JTRollView *_diceView;
	JTDiceRoll *_lastRoll;
	NSMutableArray *_diceRolls;
}

- (instancetype)init
{
	self = [super init];
	if (self) {
		
	}
	return self;
}

- (void)loadView
{
	_diceView = [[JTRollView alloc] init];
	self.view = _diceView;
	[_diceView.rollButton addTarget:self action:@selector(rollPressed:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)updateView
{
	_diceView.totalLabel.text = [NSString stringWithFormat:@"%ld", [_lastRoll rollTotal]];
	[_diceView showDiceWithRolls:_lastRoll.rolls];
}

#pragma mark - Button Presses

- (void)rollPressed:(id)sender
{
	JTDiceRoll *roll = [JTDiceRoll roll:kJTStandardDiceCount];
	_lastRoll = roll;
	[_diceRolls addObject:roll];
	
	[self updateView];
}

@end
