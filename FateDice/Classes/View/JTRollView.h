//
//  JTRollView.h
//  FateDice
//
//  Created by Joshua Tessier on 2013-10-13.
//  Copyright (c) 2013 Joshua Tessier. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JTRollView : UIView

@property (nonatomic, readonly, strong) UILabel *totalLabel;
@property (nonatomic, readonly, strong) UIButton *rollButton;

- (void)showDiceWithRolls:(NSArray*)diceRolls;

@end
