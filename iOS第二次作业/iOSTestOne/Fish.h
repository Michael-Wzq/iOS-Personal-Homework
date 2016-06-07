//
//  Fish.h
//  iOSTestOne
//
//  Created by 吴泽钦 on 1/22/16.
//  Copyright © 2016 Wu. All rights reserved.
//
#import "Animal.h"
#import <Foundation/Foundation.h>

@interface Fish : Animal
@property (copy)NSString *color;
-(id)initWithAge:(int)age withSex:(NSString*)sex withColor:(NSString *)color;
-(void)Swim;
@end
