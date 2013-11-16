//
//  JTDiceController.m
//  FateDice
//
//  Created by Joshua Tessier on 2013-10-13.
//  Copyright (c) 2013 Joshua Tessier. All rights reserved.
//

#import "JTDiceController.h"
#import <AudioToolbox/AudioToolbox.h>

//Views
#import "JTRollView.h"

//Model
#import "JTDiceRoll.h"

@implementation JTDiceController {
	JTRollView *_diceView;
	JTDiceRoll *_lastRoll;
	NSMutableArray *_diceRolls;
	SystemSoundID _diceSound;
}

- (instancetype)init
{
	self = [super init];
	if (self) {
		AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"dice" ofType:@"mp3"]], &_diceSound);
	}
	return self;
}

- (void)dealloc
{
	AudioServicesDisposeSystemSoundID(_diceSound);
}

- (void)loadView
{
	_diceView = [[JTRollView alloc] init];
	self.view = _diceView;
	[_diceView.rollButton addTarget:self action:@selector(rollPressed:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)updateView
{
	_diceView.totalLabel.text = [NSString stringWithFormat:@"%ld", (long)[_lastRoll rollTotal]];
	[_diceView showDiceWithRolls:_lastRoll.rolls];
}

#pragma mark - Button Presses

- (void)roll
{
	AudioServicesPlayAlertSound(_diceSound);
	
	JTDiceRoll *roll = [JTDiceRoll roll:kJTStandardDiceCount];
	_lastRoll = roll;
	[_diceRolls addObject:roll];
	
	[self updateView];
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
	if (motion == UIEventSubtypeMotionShake) {
		[self roll];
	}
}

- (void)rollPressed:(id)sender
{
	[self roll];
}

@end
