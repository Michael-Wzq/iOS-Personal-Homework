//
//  Fish.m
//  iOSTestOne
//
//  Created by 吴泽钦 on 1/22/16.
//  Copyright © 2016 Wu. All rights reserved.
//

#import "Fish.h"

@implementation Fish
-(id) initWithAge:(int)age withSex:(NSString *)sex withColor:(NSString *)color{
    self = [super initWithAge:age withSex:sex];
    if(self){
        _color = color;
    }
    return self;
}
-(void)animalScream{
    [super animalScream];
    NSLog(@"%d,%@,%@",self.age,self.sex,self.color);
}
-(void)fishSwim{
    NSLog(@"游泳");
}
-(void)animalMoveTime:(int)time animalMoveSpeed:(int)speed{
    [self fishSwim];
    NSLog(@"位移 = %d",time*speed);
}
-(void)Swim{
    [self fishSwim];
}
@end
