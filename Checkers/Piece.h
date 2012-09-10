//
//  Piece.h
//  Checkers
//
//  Created by Youri van der Lans on 9/7/12.
//  Copyright (c) 2012 Youri van der Lans. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Piece : NSObject {
    int type;
    int player;
}

- (id) initWithType: (int) type;
- (void) setPlayerForPiece;

@property int type;
@property int player;

@end
