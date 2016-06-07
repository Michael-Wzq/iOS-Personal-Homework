//
//  CatchFish.m
//  iOSTestOne
//
//  Created by 吴泽钦 on 1/29/16.
//  Copyright © 2016 Wu. All rights reserved.
//

#import "CatchFish.h"

@implementation CatchFish
-(void)catchFish : (NSMutableArray *)animalArray{
    int count = 10;
    unsigned long y=0;
    while (count > 0) {
        
        unsigned x = arc4random()%count+1;
        NSRange range;
        range.location = y;
        range.length = x;
        y =range.location+range.length;
        NSLog(@"抓到第%lu到第%lu",range.location+1,y);
        for (unsigned long i =range.location; i < y;i++) {
            [[animalArray objectAtIndex:i] dealloc];
        }
        
        [animalArray removeObjectsInRange:range];
        
        
        count -= x ;
        
    }
    
}
@end
