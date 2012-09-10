//
//  BoardData.m
//  Checkers
//
//  Created by Youri van der Lans on 9/7/12.
//  Copyright (c) 2012 Youri van der Lans. All rights reserved.
//

#import "BoardData.h"

@implementation BoardData

@synthesize board, moves, currentPlayer;

- (id) initWithSize:(int)theSize {
    self = [super init];
    
    if ( self ){
        currentPlayer = 1;
        opponent = 2;
        size = theSize;
        [self setupBoard];
    }
    
    return self;
}

- (id) init {
    return [self initWithSize:8];
}

- (void) setupBoard {
    board = [[NSMutableArray alloc] init];
    NSMutableArray *curRow = nil;
    
    for ( row=0; row<=size; row++ ) {
        curRow = [NSMutableArray array];
        for ( col=0; col<=size; col++ ) {
            if ( row % 2 == col % 2 ) {
                if ( row < 3 ) {
                    [curRow addObject:[[Piece alloc] initWithType:3]];
                } else if ( row > size - 4 ) {
                    [curRow addObject:[[Piece alloc] initWithType:1]];
                } else {
                    [curRow addObject:[[Piece alloc] init]];
                }
            } else {
                [curRow addObject:[[Piece alloc] init]];
            }
        }
        [board addObject:curRow];
    }
    
    [self setValidMoves];
}

- (void) makeMove:(Move *)move {
    
}

- (void) setValidMoves {
    moves = [[NSMutableArray alloc] init];
    
    [self setValidJumps];
    
    
}

- (void) setValidJumps {
    NSUInteger sizeMinusTwo = size - (NSUInteger) 2;
    
    for ( NSMutableArray *boardRow in board ) {
        currentRow = [board indexOfObject:boardRow];
        for ( Piece *piece in boardRow ) {
            currentCol = [boardRow indexOfObject:piece];
            NSLog(@"row: %li, col: %li, player: %i", currentRow, currentCol, [piece player]);
            
            // Continue if the piece doesn't belong to the current player
            if ( [piece player] != currentPlayer ) {
                continue;
            }
            
            NSUInteger currentRowMinusTwo = currentRow - (NSUInteger) 2;
            NSUInteger currentColMinusTwo = currentCol - (NSUInteger) 2;
            NSUInteger currentRowPlusTwo = currentRow + (NSUInteger) 2;
            NSUInteger currentColPlusTwo = currentCol + (NSUInteger) 2;
            
            NSUInteger currentRowMinusOne = currentRow - (NSUInteger) 1;
            NSUInteger currentColMinusOne = currentCol - (NSUInteger) 1;
            NSUInteger currentRowPlusOne = currentRow + (NSUInteger) 1;
            NSUInteger currentColPlusOne = currentCol + (NSUInteger) 1;
            
            // Continue when current piece is two blocks away for the edge
            if ( currentRow >= 2 && currentCol >= 2 ) {
                Piece *northWest = [self getPieceForRow:currentRowMinusTwo AndCol:currentColMinusTwo];
                
                // Continue when block is empty
                if ( [northWest player] == 0 ) {
                    Piece *connectingNorthWestPiece = [self getPieceForRow:currentRowMinusOne AndCol:currentColMinusOne];
                    
                    // Add move object when connecting piece belongs to the opponent
                    if ( [connectingNorthWestPiece player] == [self opponent] ) {
                        [moves addObject:[[Move alloc] initWithFromRow:currentRow AndFromCol:currentCol AndToRow:currentRowMinusTwo AndToCol:currentColMinusTwo]];
                    }
                }
            }
            if ( currentRow >= 2 && currentCol <= sizeMinusTwo ) {
                Piece *northEast = [self getPieceForRow:currentRowMinusTwo AndCol:currentColPlusTwo];
                
                if ( [northEast player] == 0 ) {
                    Piece *connectingNorthEastPiece = [self getPieceForRow:currentRowMinusOne AndCol:currentColPlusOne];
                    
                    if ( [connectingNorthEastPiece player] == [self opponent] ) {
                        [moves addObject:[[Move alloc] initWithFromRow:currentRow AndFromCol:currentCol AndToRow:currentRowMinusTwo AndToCol:currentColPlusTwo]];
                    }
                }
            }
            if ( currentRow <= sizeMinusTwo && currentCol <= sizeMinusTwo ) {
                Piece *southEast = [self getPieceForRow:currentRowPlusTwo AndCol:currentColPlusTwo];
                
                if ( [southEast player] == 0 ) {
                    Piece *connectingSouthEastPiece = [self getPieceForRow:currentRowPlusOne AndCol:currentColPlusOne];
                    
                    if ( [connectingSouthEastPiece player] == [self opponent] ) {
                        [moves addObject:[[Move alloc] initWithFromRow:currentRow AndFromCol:currentCol AndToRow:currentRowPlusTwo AndToCol:currentRowPlusTwo]];
                    }
                }
            }
            if ( currentRow <= sizeMinusTwo && currentCol >= 2 ) {
                Piece *southWest = [self getPieceForRow:currentRowPlusTwo AndCol:currentColMinusTwo];
                
                if ( [southWest player] == 0 ) {
                    Piece *connectingSouthWestPiece = [self getPieceForRow:currentRowPlusOne AndCol:currentColMinusOne];
                    
                    if ( [connectingSouthWestPiece player] == [self opponent] ) {
                        [moves addObject:[[Move alloc] initWithFromRow:currentRow AndFromCol:currentCol AndToRow:currentRowPlusTwo AndToCol:currentColMinusTwo]];
                    }
                }
            }
        }
    }
}

- (Piece *)getPieceForRow:(NSUInteger)boardRow AndCol:(NSUInteger)boardCol {
    return [[board objectAtIndex: boardRow] objectAtIndex: boardCol];
}

- (int)opponent {
    if ( currentPlayer == 1 ) {
        opponent = 2;
    } else {
        opponent = 1;
    }
    
    return opponent;
}

@end
