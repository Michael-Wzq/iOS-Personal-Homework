//
//  PageViewController.m
//  ScrollerPageView
//
//  Created by 吴泽钦 on 3/11/16.
//  Copyright © 2016 MichaelW. All rights reserved.
//

#import "PageViewController.h"
NSArray *nameArray = nil ;
NSMutableArray *imageArray = nil;
UIImage *image1 ;
UIImage *image2 ;
UIImage *image3 ;
static NSString *imageStr1 = @"https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1458807119&di=d1f77eb8443723e3e60224bc7962fbf3&src=http://img15.3lian.com/2015/f2/52/d/43.jpg";
static NSString *imageStr2 = @"http://www.bz55.com/uploads/allimg/140414/137-140414094T9.jpg";
static NSString *imageStr3 = @"http://img2.3lian.com/2014/f6/146/d/93.jpg";
@interface PageViewController()
@end

@implementation PageViewController

- (id)initWithPageNumber:(int)page{
    if (self = [super initWithNibName:@"PageViewController" bundle:nil]) {
        pageNumber = page;
    }
    return self;
}
- (void)viewDidLoad{
    [super viewDidLoad];
    
    image1 = [UIImage imageNamed:@"001.jpg"];
    image2 = [UIImage imageNamed:@"001.jpg"];
    image3 = [UIImage imageNamed:@"001.jpg"];
    [self loadAllImage];
    NSString *str1 = [PageViewController pageControlNameWithIndex:pageNumber];
    self.PageLabel.text = str1;
    
       UIImage *myImage = [PageViewController pageControlImageWithIndex:pageNumber];
    [self.ImageView setImage:myImage]; 
    
    
    
    
}

+ (NSString *)pageControlNameWithIndex:(NSUInteger)index {
    if (nameArray == nil) {
        nameArray = [[NSArray alloc]initWithObjects:@"picture1",@"picturer2",@"picture3", nil];
    }
    return [nameArray objectAtIndex:index %[nameArray count]];
}
- (UIImage *)loadImage:(NSString *)urlStr{
    
    NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:urlStr]];
    UIImage *image = [[UIImage alloc]initWithData:imageData];
    return image;
}
- (void)loadAllImage{
  
   dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
       [self.indicator startAnimating];
        UIImage *imagezzz = [self loadImage:imageStr1];
         NSLog(@"加载第一张图 %@",imagezzz);
        [imageArray replaceObjectAtIndex:0 withObject:imagezzz];
        
        UIImage *imageqqq = [self  loadImage:imageStr2];
        NSLog(@"加载第二张图 %@",imageqqq);
        [imageArray replaceObjectAtIndex:1 withObject:imageqqq];
        
        UIImage *imageaaa = [self loadImage:imageStr3];
        NSLog(@"加载第三张图 %@",imageaaa);
        [imageArray replaceObjectAtIndex:2 withObject:imageaaa];
        [self.indicator stopAnimating];
   });
    
        
}
+ (UIImage *)pageControlImageWithIndex:(NSUInteger)index {
    if (imageArray == nil) {
            imageArray = [[NSMutableArray alloc]initWithObjects:image1,image2,image3,nil];
    }
    return [imageArray objectAtIndex:index %[imageArray count]];
}

@end