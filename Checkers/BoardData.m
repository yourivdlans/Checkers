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
    
    [self setMoves];
}

- (void) makeMove:(Move *)move {
    
}

- (void) setMoves {
    moves = [[NSMutableArray alloc] init];
    
    [self setValidJumps];
    
    NSLog(@"%li jumps possible", [moves count]);
    
    // Only set valid moves when there are no jumps to be made
    if ( [moves count] > 0 ) {
        [self setValidMoves];
    }
}

- (void) setValidMoves {
    
}

- (void) setValidJumps {
    NSUInteger sizeMinusTwo = size - (NSUInteger) 2;
    
    // Loop through rows
    for ( NSMutableArray *boardRow in board ) {
        currentRow = [board indexOfObject:boardRow];
        // Loop through cols
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
            
            // Continue when current piece is two blocks away for the edge
            if ( currentRow >= 2 && currentCol >= 2 ) {
                Move *move = [[Move alloc] initWithFromRow:currentRow AndFromCol:currentCol AndToRow:currentRowMinusTwo AndToCol:currentColMinusTwo];
                
                if ( [self isValidJump:move] == true ) {
                    [moves addObject:move];
                }
            }
            if ( currentRow >= 2 && currentCol <= sizeMinusTwo ) {
                Move *move = [[Move alloc] initWithFromRow:currentRow AndFromCol:currentCol AndToRow:currentRowMinusTwo AndToCol:currentColPlusTwo];
                
                if ( [self isValidJump:move] == true ) {
                    [moves addObject:move];
                }
            }
            if ( currentRow <= sizeMinusTwo && currentCol <= sizeMinusTwo ) {
                Move *move = [[Move alloc] initWithFromRow:currentRow AndFromCol:currentCol AndToRow:currentRowPlusTwo AndToCol:currentColPlusTwo];
                
                if ( [self isValidJump:move] == true ) {
                    [moves addObject:move];
                }
            }
            if ( currentRow <= sizeMinusTwo && currentCol >= 2 ) {
                Move *move = [[Move alloc] initWithFromRow:currentRow AndFromCol:currentCol AndToRow:currentRowPlusTwo AndToCol:currentColMinusTwo];
                
                if ( [self isValidJump:move] == true ) {
                    [moves addObject:move];
                }
            }
        }
    }
}

- (bool) isValidJump:(Move *)move {
    Piece *piece = [self getPieceForRow:[move toRow] AndCol:[move toCol]];
    
    // Return false when block is not empty
    if ( [piece player] != 0 ) {
        return false;
    }
    
    // Player two can only jump down with a regular piece
    if ( currentPlayer == 2 ) {
        if ( [piece player] == 2 && [move toRow] < [move fromRow] && [piece isDouble] == false ) {
            return false;
        }
    }
    // Player one can only jump up with a regular piece
    if ( currentPlayer == 1 ) {
        if ( [piece player] == 1 && [move toRow] > [move fromRow] && [piece isDouble] == false ) {
            return false;
        }
    }
    
    NSUInteger betweenRow = ( [move fromRow] + [move toRow] ) / 2;
    NSUInteger betweenCol = ( [move fromCol] + [move toCol] ) / 2;
    
    Piece *connectingPiece = [self getPieceForRow:betweenRow AndCol:betweenCol];
    
    // Jump can only occur when the connecting piece belongs to the opponent
    if ( [connectingPiece player] != [self opponent] ) {
        return false;
    }
    
    return true;
}

- (Piece *) getPieceForRow:(NSUInteger)boardRow AndCol:(NSUInteger)boardCol {
    return [[board objectAtIndex: boardRow] objectAtIndex: boardCol];
}

- (int) opponent {
    if ( currentPlayer == 1 ) {
        opponent = 2;
    } else {
        opponent = 1;
    }
    
    return opponent;
}

@end
