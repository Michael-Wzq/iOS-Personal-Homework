//
//  City.m
//  GuessCity
//
//  Created by 吴泽钦 on 2/11/16.
//  Copyright © 2016 MichaelW. All rights reserved.
//

#import "City.h"
#pragma 城市类
@implementation City
- (instancetype) initWithId:(NSInteger)cityId cityIsGuessed:(BOOL)yesOrNo{
    self =[super init];
    if (self) {
        self.cityId = cityId;
        self.isGuessed =yesOrNo;
    }
    return self;
}
+ (instancetype) cityWithid:(NSInteger)cityid cityIsGuessed:(BOOL)yesOrNo{
    return [[City alloc] initWithId:cityid cityIsGuessed:yesOrNo];
}
@end
#pragma 城市图像数据
@implementation CityDatabase
+ (NSArray<City *> *) loadCities{
    return @[
             [City cityWithid:0 cityIsGuessed:NO],
             [City cityWithid:1 cityIsGuessed:NO],
             [City cityWithid:2 cityIsGuessed:NO],
             [City cityWithid:3 cityIsGuessed:NO],
             [City cityWithid:4 cityIsGuessed:NO],
             [City cityWithid:5 cityIsGuessed:NO],
             [City cityWithid:6 cityIsGuessed:NO],
             [City cityWithid:7 cityIsGuessed:NO],
             [City cityWithid:8 cityIsGuessed:NO],
             [City cityWithid:9 cityIsGuessed:NO]
             ];
}
+ (UIImage *) imageOfCity:(City *)city{
    NSString *imageName =[NSString stringWithFormat:@"%ld",city.cityId];
    return [UIImage imageNamed:imageName];
}

@end