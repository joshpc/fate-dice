//
//  JTDiceRollUnitTest.m
//  FateDice
//
//  Created by Joshua Tessier on 2013-10-13.
//  Copyright (c) 2013 Joshua Tessier. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "JTDiceRoll.h"

@interface JTDiceRollUnitTest : XCTestCase
@end

@implementation JTDiceRollUnitTest

- (void)rollingDiceRollWithZeroDiceGivesATotalOfZero
{
	JTDiceRoll *roll = [JTDiceRoll roll:0];
	XCTAssertEqual(0, [[roll rolls] count], @"Incorrect roll count");
	XCTAssertEqual(0, [roll rollTotal], @"rollTotal incorrect");
}

- (void)rollingFiveDiceResultsInFiveRolls
{
	JTDiceRoll *roll = [JTDiceRoll roll:5];
	XCTAssertEqual(5, [[roll rolls] count], @"Incorrect roll count");
}

- (void)rollTotalCalculatesProperly
{
	JTDiceRoll *roll = [[JTDiceRoll alloc] initWithDate:[NSDate date] rolls:@[@(JTRollNeutral), @(JTRollNeutral), @(JTRollNeutral), @(JTRollNeutral)]];
	XCTAssertEqual(0, [roll rollTotal], @"rollTotal incorrect");
	
	JTDiceRoll *roll2 = [[JTDiceRoll alloc] initWithDate:[NSDate date] rolls:@[@(JTRollPlus), @(JTRollPlus), @(JTRollPlus), @(JTRollPlus)]];
	XCTAssertEqual(4, [roll2 rollTotal], @"rollTotal incorrect");
	
	JTDiceRoll *roll3 = [[JTDiceRoll alloc] initWithDate:[NSDate date] rolls:@[@(JTRollMinus), @(JTRollMinus), @(JTRollMinus), @(JTRollMinus)]];
	XCTAssertEqual(-4, [roll3 rollTotal], @"rollTotal incorrect");
	
	JTDiceRoll *roll4 = [[JTDiceRoll alloc] initWithDate:[NSDate date] rolls:@[@(JTRollMinus), @(JTRollPlus), @(JTRollNeutral)]];
	XCTAssertEqual(0, [roll4 rollTotal], @"rollTotal Incorrect");
}

@end
