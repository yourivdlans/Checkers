//
//  Board.h
//  Checkers
//
//  Created by Youri van der Lans on 9/6/12.
//  Copyright (c) 2012 Youri van der Lans. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Board : NSObject {
    int size;
}
- (id) initWithSize: (int) size;
@end
