//
//  ViewController.m
//  GCDtest
//
//  Created by 吴泽钦 on 3/24/16.
//  Copyright © 2016 MichaelW. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activeIndicator;
@property (strong,nonatomic) UIImage *image;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
          dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
              [self loadImage];
              NSLog(@"图片加载完成");
          dispatch_async(dispatch_get_main_queue(), ^{
             [self displayImageView];
});
          });
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)loadImage{
    [self.activeIndicator startAnimating];
     NSURL *url = [NSURL URLWithString:@"https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1458807119&di=d1f77eb8443723e3e60224bc7962fbf3&src=http://img15.3lian.com/2015/f2/52/d/43.jpg"];
    NSData *data = [[NSData alloc]initWithContentsOfURL:url];
    self.image = [[UIImage alloc]initWithData:data];
}
- (void)displayImageView{
    [self.activeIndicator stopAnimating];
    self.imageView.image = self.image;
    
  
}
- (IBAction)changeAlpha:(id)sender {
    [UIView animateWithDuration:0.5f animations:^{
        self.view.alpha = 0.5;
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
