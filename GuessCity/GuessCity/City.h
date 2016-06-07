//
//  City.h
//  GuessCity
//
//  Created by 吴泽钦 on 2/11/16.
//  Copyright © 2016 MichaelW. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;
@interface City : NSObject
@property (assign,nonatomic) NSInteger cityId;
@property (nonatomic) BOOL isGuessed;
+ (instancetype) cityWithid:(NSInteger)cityid cityIsGuessed:(BOOL)yesOrNo;
@end


@interface CityDatabase : NSObject
+ (NSArray<City *> *) loadCities;
+ (UIImage *) imageOfCity:(City*)city;
@end