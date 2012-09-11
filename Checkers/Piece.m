//
//  Piece.m
//  Checkers
//
//  Created by Youri van der Lans on 9/7/12.
//  Copyright (c) 2012 Youri van der Lans. All rights reserved.
//

#import "Piece.h"

static int EMPTY = 0;
static int WHITE = 1;
static int WHITE_DOUBLE = 2;
static int BLACK = 3;
static int BLACK_DOUBLE = 4;

@implementation Piece

@synthesize type;

- (id) initWithType:(int)theType {
    self = [super init];
    
    if (self) {
        type = theType;
    }
    
    return self;
}

- (id) init {
    return [self initWithType:EMPTY];
}

- (int) player {
    player = 0;
    
    if ( type == WHITE || type == WHITE_DOUBLE ) {
        player = 1;
    } else if ( type == BLACK || type == BLACK_DOUBLE ) {
        player = 2;
    }
    
    return player;
}

- (bool) isDouble {
    result = false;
    
    if ( type == WHITE_DOUBLE || type == BLACK_DOUBLE ) {
        result = true;
    }
    
    return result;
}

@end
