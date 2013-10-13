//
//  JTDiceRoll.m
//  FateDice
//
//  Created by Joshua Tessier on 2013-10-13.
//  Copyright (c) 2013 Joshua Tessier. All rights reserved.
//

#import "JTDiceRoll.h"

@implementation JTDiceRoll

- (instancetype)initWithDate:(NSDate*)date rolls:(NSArray*)rolls
{
	self = [super init];
	if (self) {
		_date = date;
		_rolls = [rolls copy];
	}
	return self;
}

- (NSInteger)rollTotal
{
	NSInteger total = 0;
	for (NSNumber *number in _rolls) {
		total += [number integerValue];
	}
	return total;
}

+ (JTRoll)rollSingleDie
{
	return (NSInteger)(arc4random() % 3) - 1;
}

+ (JTDiceRoll*)roll:(NSUInteger)numberOfDice
{
	NSMutableArray *rolls = [[NSMutableArray alloc] init];
	for (NSUInteger i = 0; i < numberOfDice; ++i) {
		[rolls addObject:@([JTDiceRoll rollSingleDie])];
	}
	return [[JTDiceRoll alloc] initWithDate:[NSDate date] rolls:rolls];
}

@end
