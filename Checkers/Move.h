//
//  Move.h
//  Checkers
//
//  Created by Youri van der Lans on 9/7/12.
//  Copyright (c) 2012 Youri van der Lans. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Move : NSObject {
    NSUInteger fromRow, fromCol, toRow, toCol;
}

- (id) initWithFromRow: (NSUInteger) fromRow AndFromCol: (NSUInteger) fromCol AndToRow: (NSUInteger) toRow AndToCol: (NSUInteger) toCol;

@property NSUInteger fromRow, fromCol, toRow, toCol;

@end
