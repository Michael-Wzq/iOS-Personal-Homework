//
//  NSMutableArray.m
//  iOSTestOne
//
//  Created by 吴泽钦 on 1/28/16.
//  Copyright © 2016 Wu. All rights reserved.
//

#import "NSMutableArray.h"
#import "Bird.h"
#import "Fish.h"
@implementation NSMutableArray(test)
-(void) recognizeAnimal{
    for (int i = 0; i < self.count; i++) {
        if ( [[self objectAtIndex:i] isMemberOfClass:[Bird class]]) {
            [[self objectAtIndex:i] Fly];
        }
        if ( [[self objectAtIndex:i] isMemberOfClass:[Fish class]]) {
            [[self objectAtIndex:i] Swim];
        }
    }

}
@end
