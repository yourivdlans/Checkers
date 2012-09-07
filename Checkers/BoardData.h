//
//  BoardData.h
//  Checkers
//
//  Created by Youri van der Lans on 9/7/12.
//  Copyright (c) 2012 Youri van der Lans. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Move.h"

@interface BoardData : NSObject {
    int size;
    int row;
    int col;
}

- (id) initWithSize: (int) size;
- (void) setupBoard: (int) size;
- (void) makeMove: (Move *) move;
- (Move *) getValidMoves: (int) player;
- (Move *) getValidJumps: (int) player;

@end
