//
//  JTDiceRoll.h
//  FateDice
//
//  Created by Joshua Tessier on 2013-10-13.
//  Copyright (c) 2013 Joshua Tessier. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JTDiceRoll : NSObject

@property (nonatomic, readonly, strong) NSDate *date;
@property (nonatomic, readonly, copy) NSArray *rolls;

- (instancetype)initWithDate:(NSDate*)date rolls:(NSArray*)rolls;
- (NSInteger)rollTotal;

+ (JTDiceRoll*)roll:(NSUInteger)numberOfDice;

@end
