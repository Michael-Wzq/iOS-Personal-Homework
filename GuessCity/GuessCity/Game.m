//
//  Game.m
//  GuessCity
//
//  Created by 吴泽钦 on 2/11/16.
//  Copyright © 2016 MichaelW. All rights reserved.
//

#import "Game.h"
#import "City.h"
@interface Game () {
    NSInteger _currentCity;
    NSArray * _cities;
    NSInteger  _score;
    NSInteger _allowedTimes;
}
@end
@implementation Game
+ (instancetype) game{
    return [[Game alloc] init];
}
- (instancetype) init{
    self = [super init];
    if (self) {
        _cities = [CityDatabase loadCities];
        _score = 0;
        _allowedTimes = 5;
        _currentCity = [self randomCityId];
    }
    return self;
}
- (NSInteger) randomCityId{
    do
    {
        NSInteger currentId = arc4random_uniform((u_int32_t)_cities.count);
        City * city = _cities[currentId];
        if (!city.isGuessed)
            return currentId;
    }while(1);
    
    return 0;
}
- (UIImage *) imageOfCurrentCity {
    return [CityDatabase imageOfCity:_cities[_currentCity]];
}
- (NSString *) currentScore {
    return [[NSString alloc]initWithFormat:@"%lu",_score];
}
- (BOOL)guessCity:(NSInteger)cityId{

   if (_currentCity==cityId) {
        _score += 10;
       if (_score==100) {
           return YES;
       }
        ((City *)_cities[_currentCity]).isGuessed = YES;
        _currentCity = [self randomCityId];
       return YES;
    }
    return NO;
}

@end
