//
//  Move.m
//  Checkers
//
//  Created by Youri van der Lans on 9/7/12.
//  Copyright (c) 2012 Youri van der Lans. All rights reserved.
//

#import "Move.h"

@implementation Move

- (id) initWithFromRow:(int)theFromRow AndFromCol:(int)theFromCol AndToRow:(int)theToRow AndToCol:(int)theToCol {
    self = [super init];
    
    if ( self ) {
        fromRow = theFromRow;
        fromCol = theFromCol;
        toRow = theToRow;
        toCol = theToCol;
    }
    
    return self;
}

@end
