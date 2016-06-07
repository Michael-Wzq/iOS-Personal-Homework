//
//  Bird.m
//  iOSTestOne
//
//  Created by 吴泽钦 on 1/22/16.
//  Copyright © 2016 Wu. All rights reserved.
//

#import "Bird.h"

@implementation Bird
-(id) initWithAge:(int)age withSex:(NSString *)sex withColor:(NSString *)color{
    self = [super initWithAge:age withSex:sex];
    if(self){
        _color = color;
    }
    return self;
}
//私有的类方法
-(void)birdFly{
    NSLog(@"飞翔");
}
-(void)animalScream{
    [super animalScream];
    NSLog(@"%d,%@,%@",self.age,self.sex,self.color);
}
-(void)animalMoveTime:(int)time animalMoveSpeed:(int)speed{
    [self birdFly];
    NSLog(@"位移 = %d",time*speed);
}


-(void)Fly{
    [self birdFly];
}
@end
