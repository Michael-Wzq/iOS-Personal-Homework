//
//  CatchFish.h
//  iOSTestOne
//
//  Created by 吴泽钦 on 1/29/16.
//  Copyright © 2016 Wu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CatchFishDelegate.h"
@interface CatchFish : NSObject<CatchFishDelegate>
-(void)catchFish : (NSMutableArray *)animalArray;
@end
