//
//  ViewController.m
//  PageControl
//
//  Created by 吴泽钦 on 3/11/16.
//  Copyright © 2016 MichaelW. All rights reserved.
//

#import "ViewController.h"
NSArray *nameArray = nil ;
NSArray *imageArray = nil;
@interface ViewController ()

@end

@implementation ViewController

- (id)initWithPageNumber:(int)page{
    if (self = [super initWithNibName:@"ViewController" bundle:nil]) {
        pageNumber = page;
    }
    return self;
}
- (void)viewDidLoad{
    [super viewDidLoad];
    NSString *str1 = [ViewController pageControlNameWithIndex:pageNumber];
    self.PageLabel.text = str1;
    NSString *str = [[NSString alloc]initWithFormat:@"%@",[ViewController pageControlImageWithIndex:pageNumber]];
    UIImage *myImage = [UIImage imageNamed:str];
    [self.ImageView setImage:myImage];
    
    
}

+ (NSString *)pageControlNameWithIndex:(NSUInteger)index {
    if (nameArray == nil) {
        nameArray = [[NSArray alloc]initWithObjects:@"欢迎来到口袋社区1",@"欢迎来到口袋社区2",@"欢迎来到口袋社区3", nil];
    }
    return [nameArray objectAtIndex:index %[nameArray count]];
}

+ (UIImage *)pageControlImageWithIndex:(NSUInteger)index {
    if (imageArray == nil) {
        imageArray = [[NSArray alloc]initWithObjects:@"main_image_2.jpg",@"main_image_3.jpg",@"main_image_1.jpg", nil];
    }
    return [imageArray objectAtIndex:index %[imageArray count]];
}


@end
