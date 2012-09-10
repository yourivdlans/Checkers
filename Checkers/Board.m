//
//  Board.m
//  Checkers
//
//  Created by Youri van der Lans on 9/6/12.
//  Copyright (c) 2012 Youri van der Lans. All rights reserved.
//

#import "Board.h"
#import "BoardData.h"
#import "Piece.h"

@implementation Board

- (id) initWithSize:(int)theSize {
    self = [super init];
    
    if (self) {
        size = theSize;
        BoardData *boarddata = [[BoardData alloc] initWithSize:theSize];
        NSMutableArray *row = [[NSMutableArray alloc] init];
        row = [[boarddata board] objectAtIndex: (int) 0];
        Piece *piece = [row objectAtIndex:(int) 0];
        
        NSLog(@"%i", [piece type]);
        NSLog(@"%i", [piece player]);
    }
    
    return self;
}

- (id) init {
    return [self initWithSize:8];
}

@end
