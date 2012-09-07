//
//  BoardData.m
//  Checkers
//
//  Created by Youri van der Lans on 9/7/12.
//  Copyright (c) 2012 Youri van der Lans. All rights reserved.
//

#import "BoardData.h"
#import "Piece.h"

@implementation BoardData

- (id) initWithSize:(int)theSize {
    self = [super init];
    
    if ( self ){
        [self setupBoard:theSize];
    }
    
    return self;
}

- (id) init {
    return [self initWithSize:8];
}

- (void) setupBoard:(int)theSize {
    NSMutableArray *board = [[NSMutableArray alloc] init];
    NSMutableArray *curRow = nil;
    
    for ( row=0; row<=theSize; row++ ) {
        curRow = [NSMutableArray array];
        for ( col=0; col<=theSize; col++ ) {
            if ( row % 2 == col % 2 ) {
                if ( row < 3 ) {
                    [curRow addObject:[[Piece alloc] initWithType:1]];
                } else if ( row > size - 4 ) {
                    [curRow addObject:[[Piece alloc] initWithType:3]];
                } else {
                    [curRow addObject:[[Piece alloc] init]];
                }
            } else {
                [curRow addObject:[[Piece alloc] init]];
            }
        }
        [board addObject:curRow];
    }
}

- (void) makeMove:(Move *)move {
    
}

- (Move *)getValidMoves:(int)player {
    
}

- (Move *)getValidJumps:(int)player {
    
}

@end
