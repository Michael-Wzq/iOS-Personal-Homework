//
//  ViewController.h
//  ScrollerPageView
//
//  Created by 吴泽钦 on 3/11/16.
//  Copyright © 2016 MichaelW. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface ViewController : UIViewController<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
- (IBAction)changePage:(id)sender;
@property (strong,nonatomic) NSMutableArray *imageViews;


@end
