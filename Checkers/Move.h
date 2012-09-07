//
//  Move.h
//  Checkers
//
//  Created by Youri van der Lans on 9/7/12.
//  Copyright (c) 2012 Youri van der Lans. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Move : NSObject {
    int fromRow;
    int fromCol;
    int toRow;
    int toCol;
}

- (id) initWithFromRow: (int) fromRow AndFromCol: (int) fromCol AndToRow: (int) toRow AndToCol: (int) toCol;

@end
