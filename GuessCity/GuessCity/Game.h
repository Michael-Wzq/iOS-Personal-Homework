//
//  Game.h
//  GuessCity
//
//  Created by 吴泽钦 on 2/11/16.
//  Copyright © 2016 MichaelW. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;
@interface Game : NSObject
@property (nonatomic) BOOL gameOver;
+ (instancetype) game;
- (BOOL)guessCity:(NSInteger)cityId;
- (UIImage *) imageOfCurrentCity;
- (NSString *) currentScore;
@end
