//
//  Board.m
//  Checkers
//
//  Created by Youri van der Lans on 9/6/12.
//  Copyright (c) 2012 Youri van der Lans. All rights reserved.
//

#import "Board.h"
#import "BoardData.h"

@implementation Board

- (id) initWithSize:(int)theSize {
    self = [super init];
    
    if (self) {
        size = theSize;
        BoardData *boarddata = [[BoardData alloc] initWithSize:theSize];
    }
    
    return self;
}

- (id) init {
    return [self initWithSize:8];
}

@end
