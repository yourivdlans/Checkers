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

- (id) initWithType:(int)theType {
    self = [super init];
    
    if (self) {
        type = theType;
    }
    
    return self;
}

- (id) init {
    return [self initWithType:0];
}

@end
