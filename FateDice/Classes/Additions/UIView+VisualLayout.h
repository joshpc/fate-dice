//
//  UIView+VisualLayout.h
//  FateDice
//
//  Created by Joshua Tessier on 2013-10-13.
//  Copyright (c) 2013 Joshua Tessier. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (VisualLayout)

- (void)addConstraintsWithVisualFormat:(NSString*)format metrics:(NSDictionary*)metrics views:(NSDictionary*)views;
- (void)addConstraintsWithVisualFormat:(NSString*)format options:(NSLayoutFormatOptions)options metrics:(NSDictionary*)metrics views:(NSDictionary*)views;

@end
