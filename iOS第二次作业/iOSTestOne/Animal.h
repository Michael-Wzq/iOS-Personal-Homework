//
//  NSObject+Animal.h
//  iOSTestOne
//
//  Created by 吴泽钦 on 1/22/16.
//  Copyright © 2016 Wu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Animal : NSObject 
{
    float weight;
}
@property (assign)int age;
@property (copy)NSString *sex;
-(void)animalScream;
-(void)animalMoveTime: (int)time animalMoveSpeed:(int)speed;
-(id)initWithAge:(int)age withSex:(NSString*)sex;
-(void)dealloc;
@end
