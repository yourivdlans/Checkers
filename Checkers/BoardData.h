//
//  BoardData.h
//  Checkers
//
//  Created by Youri van der Lans on 9/7/12.
//  Copyright (c) 2012 Youri van der Lans. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Move.h"
#import "Piece.h"

@interface BoardData : NSObject {
    NSMutableArray *board;
    NSMutableArray *moves;
    int size;
    int row;
    int col;
    int currentPlayer, opponent;
    NSUInteger currentRow, currentCol;
}

- (id) initWithSize: (int) size;
- (void) setupBoard;
- (void) makeMove: (Move *) move;
- (void) setValidMoves;
- (void) setValidJumps;
- (Piece *) getPieceForRow: (NSUInteger) row AndCol: (NSUInteger) col;
- (int) opponent;

@property NSMutableArray *board;
@property NSMutableArray *moves;
@property int currentPlayer;

@end
