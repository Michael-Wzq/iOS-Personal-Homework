//
//  NSObject+Animal.m
//  iOSTestOne
//
//  Created by 吴泽钦 on 1/22/16.
//  Copyright © 2016 Wu. All rights reserved.
//

#import "Animal.h"

@implementation Animal
-(id)initWithAge:(int)age withSex:(NSString *)sex{
    self = [super init];
    if(self){
        _age = age;
        _sex = sex;
    }
    return self;
}
-(void)animalScream{
    NSLog(@"hello");
}
-(void)animalMoveTime:(int)time animalMoveSpeed:(int)speed{
    int s;
    s = time * speed;
    NSLog(@"位移 = %d",s);
}
-(void)dealloc{
    NSLog(@"死亡信息");
}
@end
