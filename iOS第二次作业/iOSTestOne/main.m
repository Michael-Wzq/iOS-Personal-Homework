//
//  main.m
//  iOSTestOne
//
//  Created by 吴泽钦 on 1/22/16.
//  Copyright © 2016 Wu. All rights reserved.
//
#import "NSMutableArray.h"
#import "Animal.h"
#import "Bird.h"
#import "Fish.h"
#import <Foundation/Foundation.h>
#import "CatchFish.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
     /*    第一周作业
              Animal *animal = [[Animal alloc]initWithAge:5 withSex:@"male"];
        [animal animalScream];
        [animal animalMoveTime:5 animalMoveSpeed:5];
        Bird *bird = [[Bird alloc]initWithAge:6 withSex:@"female" withColor:@"red"];
        [bird animalScream];
        [bird animalMoveTime:6 animalMoveSpeed:6];
        Fish *fish = [[Fish alloc]initWithAge:7 withSex:@"male" withColor:@"blue"];
        [fish animalScream];
        [fish animalMoveTime:7 animalMoveSpeed:7];
        */
        NSArray *sex = [NSArray arrayWithObjects:@"male",@"female",nil];
        NSArray *color = [NSArray arrayWithObjects:@"blue",@"red",@"yellow",@"black",@"white",@"gold",nil];
        NSMutableArray<Bird *> *birdArray = [[NSMutableArray alloc] init];
        NSMutableArray<Fish *> *fishArray = [[NSMutableArray alloc] init];
        NSMutableArray *animalArray = [[NSMutableArray alloc] init];
        for (int i=0; i<10; i++) {
            unsigned x = arc4random();
            Bird *a = [[Bird alloc] initWithAge:(x%20) withSex:[sex objectAtIndex:(x%2)] withColor:[color objectAtIndex:(x%6)]];
                        [birdArray addObject:a];
            unsigned y = arc4random();
            Fish *b = [[Fish alloc]  initWithAge:(y%20) withSex:[sex objectAtIndex:(y%2)] withColor:[color objectAtIndex:(y%6)]];
            [fishArray addObject:b];
        }
        [animalArray addObjectsFromArray:fishArray];
        [animalArray addObjectsFromArray:birdArray];
        
        [animalArray recognizeAnimal];
        CatchFish *catchFish = [[CatchFish alloc]init];
        [catchFish catchFish:animalArray];
  
    }
    return 0;
}
