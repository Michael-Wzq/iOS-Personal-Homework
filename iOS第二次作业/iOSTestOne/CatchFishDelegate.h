//
//  CatchFishDelegate.h
//  iOSTestOne
//
//  Created by 吴泽钦 on 1/29/16.
//  Copyright © 2016 Wu. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol CatchFishDelegate <NSObject>
-(void)catchFish : (NSMutableArray *)animalArray;
@end