//
//  JTConstants.h
//  FateDice
//
//  Created by Joshua Tessier on 2013-10-13.
//  Copyright (c) 2013 Joshua Tessier. All rights reserved.
//

#pragma mark - Animation Constants

extern const CGFloat kJTShortAnimationDuration;
extern const CGFloat kJTAverageAnimationDuration;

#pragma mark - View Constants

extern const CGFloat kJTCornerRadius;
extern const CGFloat kJTViewPadding;
extern const CGFloat kJTButtonHeight;
extern const NSUInteger kJTMaxDicePerRow;

#pragma mark - Font Constants

extern const CGFloat kJTSmallFontSize;
extern const CGFloat kJTMediumFontSize;
extern const CGFloat kJTLargeFontSize;
extern const CGFloat kJTExtraLargeFontSize;

#pragma mark - Application Constants & Enums

extern const NSUInteger kJTStandardDiceCount;

typedef NS_ENUM(NSInteger, JTRoll) {
	JTRollNeutral = 0,
	JTRollPlus = 1,
	JTRollMinus = -1
};